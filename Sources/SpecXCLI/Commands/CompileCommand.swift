import ArgumentParser
import Foundation

struct CompileCommand: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "compile",
        abstract: "Compile prompt into SpecX markdown"
    )

    static let defaultBaseURL = "https://specx.opeiai.com"
    static let defaultFormat = "md"
    static let defaultLocale = "zh"
    static let defaultSpecVersion = "3.3"
    static let promptLimit = 20_000

    @Argument(help: "Input file path or '-' for stdin")
    var input: String

    @Option(name: [.short, .long], help: "Output file path")
    var output: String?

    @Option(name: .long, help: "Locale: zh or en")
    var locale: String?

    @Option(name: .long, help: "Output format (only md)")
    var format: String = CompileCommand.defaultFormat

    @Flag(name: .long, help: "Only output spec hash")
    var hashOnly: Bool = false

    @Option(name: .long, help: "Override API base URL")
    var baseURL: String?

    mutating func run() async throws {
        do {
            let normalizedFormat = format.lowercased()
            if normalizedFormat != Self.defaultFormat {
                throw CLIError("--format only supports 'md'", exitCode: .invalidArguments)
            }

            let effectiveLocale = (locale ?? Self.defaultLocale).lowercased()
            if effectiveLocale != "zh" && effectiveLocale != "en" {
                throw CLIError("--locale only supports 'zh' or 'en'", exitCode: .invalidArguments)
            }

            let prompt = try IO.readText(input)
            if prompt.count > Self.promptLimit {
                throw CLIError("prompt is too long (max \(Self.promptLimit) characters)", exitCode: .invalidArguments)
            }

            let apiKey = ProcessInfo.processInfo.environment["SPECX_API_KEY"]?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            if apiKey.isEmpty {
                throw CLIError("SPECX_API_KEY is required. Example: export SPECX_API_KEY=xxxxx", exitCode: .missingAuth)
            }

            let effectiveBaseURL = (baseURL ?? ProcessInfo.processInfo.environment["SPECX_API_BASE"] ?? Self.defaultBaseURL)
                .trimmingCharacters(in: .whitespacesAndNewlines)

            let client = try SpecXAPIClient(apiKey: apiKey, baseURL: effectiveBaseURL)
            let request = CompileRequest(
                prompt: prompt,
                locale: effectiveLocale,
                format: normalizedFormat,
                specVersion: Self.defaultSpecVersion,
                client: .init(name: "specx-cli", version: cliVersion)
            )

            let response = try await client.compile(request: request)
            let content = hashOnly ? response.specHash : response.specMD
            try IO.writeText(content, to: output)
        } catch let error as CLIError {
            ErrorPrinter.printError(error)
            throw ArgumentParser.ExitCode(rawValue: error.exitCode.rawValue)
        } catch {
            ErrorPrinter.printError(CLIError(error.localizedDescription, exitCode: .serverOrParsing))
            throw ArgumentParser.ExitCode(rawValue: ExitCode.serverOrParsing.rawValue)
        }
    }
}
