//
//  NetworkManager.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func createRequest<T: Codable, U: Codable>(
        with url: APIUrls,
        method: HttpMethods,
        body: T? = nil,
        responseType: U.Type
    ) async throws -> U {
        
        guard let url = URL(string: url.fullURL) else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body = body {
            urlRequest.httpBody = try JSONEncoder().encode(body)
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(U.self, from: data)
        return decodedResponse
    }
}
