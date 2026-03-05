import XCTest
@testable import SpecXCLI

final class CompileTests: XCTestCase {
    func testCompileRequestEncoding() throws {
        let request = CompileRequest(
            prompt: "hello",
            locale: "zh",
            format: "md",
            specVersion: "3.3",
            client: .init(name: "specx-cli", version: "0.1.0")
        )

        let data = try JSONEncoder().encode(request)
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]

        XCTAssertEqual(json?["prompt"] as? String, "hello")
        XCTAssertEqual(json?["locale"] as? String, "zh")
        XCTAssertEqual(json?["format"] as? String, "md")
        XCTAssertEqual(json?["spec_version"] as? String, "3.3")

        let client = json?["client"] as? [String: Any]
        XCTAssertEqual(client?["name"] as? String, "specx-cli")
        XCTAssertEqual(client?["version"] as? String, "0.1.0")
    }

    func testCompileResponseDecodingSnakeCase() throws {
        let payload = """
        {"spec_md":"x","hash":"h","request_id":"r"}
        """

        let response = try JSONDecoder().decode(CompileResponse.self, from: Data(payload.utf8))
        XCTAssertEqual(response.specMd, "x")
        XCTAssertEqual(response.hash, "h")
        XCTAssertEqual(response.requestId, "r")
    }

    func testCompileResponseDecodingCamelCase() throws {
        let payload = """
        {"specMd":"x","hash":"h","requestId":"r"}
        """

        let response = try JSONDecoder().decode(CompileResponse.self, from: Data(payload.utf8))
        XCTAssertEqual(response.specMd, "x")
        XCTAssertEqual(response.hash, "h")
        XCTAssertEqual(response.requestId, "r")
    }

    func testConstants() {
        XCTAssertEqual(cliVersion, "0.1.0")
        XCTAssertEqual(CompileCommand.defaultBaseURL, "https://specx.opeiai.com")
        XCTAssertEqual(CompileCommand.defaultFormat, "md")
        XCTAssertEqual(CompileCommand.defaultSpecVersion, "3.3")
    }
}
