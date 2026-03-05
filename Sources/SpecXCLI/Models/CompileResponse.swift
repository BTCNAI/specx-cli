import Foundation

struct CompileResponse: Codable {
    let specMd: String
    let hash: String?
    let requestId: String?

    enum CodingKeys: String, CodingKey {
        case spec_md
        case specMd
        case hash
        case request_id
        case requestId
    }

    init(specMd: String, hash: String?, requestId: String?) {
        self.specMd = specMd
        self.hash = hash
        self.requestId = requestId
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        if let v = try c.decodeIfPresent(String.self, forKey: .spec_md) {
            self.specMd = v
        } else if let v = try c.decodeIfPresent(String.self, forKey: .specMd) {
            self.specMd = v
        } else {
            throw DecodingError.keyNotFound(
                CodingKeys.spec_md,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Missing required field: spec_md/specMd"
                )
            )
        }

        self.hash = try c.decodeIfPresent(String.self, forKey: .hash)

        if let v = try c.decodeIfPresent(String.self, forKey: .request_id) {
            self.requestId = v
        } else {
            self.requestId = try c.decodeIfPresent(String.self, forKey: .requestId)
        }
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(specMd, forKey: .spec_md)
        try c.encodeIfPresent(hash, forKey: .hash)
        try c.encodeIfPresent(requestId, forKey: .request_id)
    }
}

struct APIErrorResponse: Decodable {
    let message: String?
    let error: String?
}
