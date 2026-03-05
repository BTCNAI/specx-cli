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

    func testCompileResponseDecoding() throws {
        let payload = """
        {
          "spec_md": "# title",
          "spec_hash": "abc123",
          "meta": {"spec_id": "id1", "created_at": "2026-03-05T00:00:00Z"}
        }
        """

        let response = try JSONDecoder().decode(CompileResponse.self, from: Data(payload.utf8))
        XCTAssertEqual(response.specMD, "# title")
        XCTAssertEqual(response.specHash, "abc123")
        XCTAssertEqual(response.meta?.specID, "id1")
        XCTAssertEqual(response.meta?.createdAt, "2026-03-05T00:00:00Z")
    }

    func testConstants() {
        XCTAssertEqual(cliVersion, "0.1.0")
        XCTAssertEqual(CompileCommand.defaultBaseURL, "https://specx.opeiai.com")
        XCTAssertEqual(CompileCommand.defaultFormat, "md")
        XCTAssertEqual(CompileCommand.defaultSpecVersion, "3.3")
    }
}
