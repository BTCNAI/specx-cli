import ArgumentParser
import Foundation

let cliVersion = "0.1.0"

struct SpecXCLI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "specx",
        abstract: "SpecX CLI",
        version: cliVersion,
        subcommands: [CompileCommand.self]
    )
}
