import Foundation

struct CompileRequest: Encodable {
    let prompt: String
    let locale: String
    let format: String
    let specVersion: String
    let client: ClientInfo

    struct ClientInfo: Encodable {
        let name: String
        let version: String

        enum CodingKeys: String, CodingKey {
            case name
            case version
        }
    }

    enum CodingKeys: String, CodingKey {
        case prompt
        case locale
        case format
        case specVersion = "spec_version"
        case client
    }
}
