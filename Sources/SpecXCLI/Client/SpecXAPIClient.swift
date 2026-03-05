import Foundation

struct SpecXAPIClient {
    private let apiKey: String
    private let baseURL: URL
    private let session: URLSession

    init(apiKey: String, baseURL: String) throws {
        guard let url = URL(string: baseURL) else {
            throw CLIError("invalid base URL: \(baseURL)", exitCode: .invalidArguments)
        }
        self.apiKey = apiKey
        self.baseURL = url

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 15
        self.session = URLSession(configuration: config)
    }

    func compile(request: CompileRequest) async throws -> CompileResponse {
        let endpoint = baseURL.appendingPathComponent("v1/spec/compile")
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("specx-cli/\(cliVersion)", forHTTPHeaderField: "User-Agent")

        let encoder = JSONEncoder()
        do {
            urlRequest.httpBody = try encoder.encode(request)
        } catch {
            throw CLIError("failed to encode request", exitCode: .serverOrParsing)
        }

        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await session.data(for: urlRequest)
        } catch {
            throw CLIError("network error: \(error.localizedDescription)", exitCode: .networkOrHTTP)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CLIError("invalid HTTP response", exitCode: .networkOrHTTP)
        }

        let requestID = requestID(from: httpResponse)
        if !(200..<300).contains(httpResponse.statusCode) {
            let message = parseErrorMessage(data) ?? "HTTP \(httpResponse.statusCode)"
            throw CLIError(message, exitCode: .networkOrHTTP, requestID: requestID)
        }

        do {
            return try JSONDecoder().decode(CompileResponse.self, from: data)
        } catch {
            throw CLIError("failed to parse service response", exitCode: .serverOrParsing, requestID: requestID)
        }
    }

    private func parseErrorMessage(_ data: Data) -> String? {
        guard !data.isEmpty else { return nil }
        if let decoded = try? JSONDecoder().decode(APIErrorResponse.self, from: data) {
            if let message = decoded.message, !message.isEmpty {
                return message
            }
            if let error = decoded.error, !error.isEmpty {
                return error
            }
        }
        return String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func requestID(from response: HTTPURLResponse) -> String? {
        if let value = response.value(forHTTPHeaderField: "x-request-id") {
            return value
        }
        if let value = response.value(forHTTPHeaderField: "request-id") {
            return value
        }
        return nil
    }
}
