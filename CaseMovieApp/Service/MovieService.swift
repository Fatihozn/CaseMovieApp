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
            let movies: [Movie] = try await NetworkManager.shared.createRequest(
                with: .getAllMovies,
                method: .GET
            )
            
            return .success(movies)
        } catch {
            return.failure(error)
        }
    }
    
    func fetchLikedMovieIDs(token: String) async -> Result<[Int], Error> {
        do {
            let likedMovieIDs: [Int] = try await NetworkManager.shared.createRequest(
                with: .getLikedMovieIDs,
                method: .GET,
                token: token
            )
            
            return .success(likedMovieIDs)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchLikedMovies(token: String) async -> Result<[Movie], Error> {
        do {
            let likedMovies: [Movie] = try await NetworkManager.shared.createRequest(
                with: .getLikedMovies,
                method: .GET,
                token: token
            )
            
            return .success(likedMovies)
        } catch {
            return .failure(error)
        }
    }
    
    func likeMovie(id: Int, token: String) async -> Result<LikeUnLikeResponse, Error> {
        do {
            let response: LikeUnLikeResponse = try await NetworkManager.shared.createRequest(
                with: .postLikeMovie(id: id),
                method: .POST,
                token: token
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func unLikeMovie(id: Int, token: String) async -> Result<LikeUnLikeResponse, Error> {
        do {
            let response: LikeUnLikeResponse = try await NetworkManager.shared.createRequest(
                with: .postUnlikeMovie(id: id),
                method: .POST,
                token: token
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
}
