import Foundation

struct CompileResponse: Decodable {
    let specMD: String
    let specHash: String
    let meta: Meta?

    struct Meta: Decodable {
        let specID: String?
        let createdAt: String?

        enum CodingKeys: String, CodingKey {
            case specID = "spec_id"
            case createdAt = "created_at"
        }
    }

    enum CodingKeys: String, CodingKey {
        case specMD = "spec_md"
        case specHash = "spec_hash"
        case meta
    }
}

struct APIErrorResponse: Decodable {
    let message: String?
    let error: String?
}
