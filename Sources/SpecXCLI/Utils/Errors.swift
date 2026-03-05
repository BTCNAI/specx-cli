import Foundation

enum ExitCode: Int32 {
    case success = 0
    case invalidArguments = 2
    case missingAuth = 3
    case networkOrHTTP = 4
    case serverOrParsing = 5
}

struct CLIError: Error {
    let message: String
    let exitCode: ExitCode
    let requestID: String?

    init(_ message: String, exitCode: ExitCode, requestID: String? = nil) {
        self.message = message
        self.exitCode = exitCode
        self.requestID = requestID
    }
}

enum ErrorPrinter {
    static func printError(_ error: CLIError) {
        FileHandle.standardError.write(Data(("Error: \(error.message)\n").utf8))
        if let requestID = error.requestID, !requestID.isEmpty {
            FileHandle.standardError.write(Data(("request_id: \(requestID)\n").utf8))
        }
    }
}
