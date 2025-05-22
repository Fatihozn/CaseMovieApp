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

    func createRequest<U: Codable>(
        with url: APIUrls,
        method: HttpMethods,
        token: String? = nil,
        body: Codable? = nil,
        responseType: U.Type
    ) async throws -> U {
        
        guard let url = URL(string: url.fullURL) else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        

        if let token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
        }
        
        if let body {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
