//
//  MovieService.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import Foundation

final class MovieService {
    static let shared = MovieService()
    
    private init() {}
    
    func fetchMovies() async -> Result<[Movie], Error> {
        do {
            let movies = try await NetworkManager.shared.createRequest(
                with: .getAllMovies,
                method: .GET,
                responseType: [Movie].self)
            
            return .success(movies)
        } catch {
            return.failure(error)
        }
    }
    
    func fetchLikedMovies(token: String) async -> Result<[Movie], Error> {
        do {
            let likedMovies = try await NetworkManager.shared.createRequest(
                with: .getLikedMovies,
                method: .GET,
                token: token,
                responseType: [Movie].self)
            
            return .success(likedMovies)
        } catch {
            return .failure(error)
        }
    }
}
