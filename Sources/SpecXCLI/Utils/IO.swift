import Foundation

enum IO {
    static func readText(_ input: String) throws -> String {
        if input == "-" {
            let data = FileHandle.standardInput.readDataToEndOfFile()
            guard let text = String(data: data, encoding: .utf8) else {
                throw CLIError("stdin is not valid UTF-8", exitCode: .invalidArguments)
            }
            return text
        }

        do {
            return try String(contentsOfFile: input, encoding: .utf8)
        } catch {
            throw CLIError("failed to read input file: \(input)", exitCode: .invalidArguments)
        }
    }

    static func writeText(_ text: String, to outputPath: String?) throws {
        guard let outputPath else {
            FileHandle.standardOutput.write(Data(text.utf8))
            if !text.hasSuffix("\n") {
                FileHandle.standardOutput.write(Data("\n".utf8))
            }
            return
        }

        let outputURL = URL(fileURLWithPath: outputPath)
        let directoryURL = outputURL.deletingLastPathComponent()
        let tmpURL = directoryURL.appendingPathComponent(".\(UUID().uuidString).tmp")

        do {
            try Data(text.utf8).write(to: tmpURL, options: .atomic)
            if FileManager.default.fileExists(atPath: outputURL.path) {
                _ = try FileManager.default.replaceItemAt(outputURL, withItemAt: tmpURL)
            } else {
                try FileManager.default.moveItem(at: tmpURL, to: outputURL)
            }
        } catch {
            if FileManager.default.fileExists(atPath: tmpURL.path) {
                try? FileManager.default.removeItem(at: tmpURL)
            }
            throw CLIError("failed to write output file: \(outputPath)", exitCode: .invalidArguments)
        }
    }
}
