//
//  APIUrls.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

enum APIUrls {
    case postLogin
    case postRegister
    case getCurrentUser
    case getAllMovies
    case getMovieByID(id: Int)
    case postLikeMovie(id: Int)
    case postUnlikeMovie(id: Int)
    case getLikedMovies
    case getLikedMovieIDs
    case putUserProfile
    
    private var path: String {
        switch self {
        case .postLogin:
            return "/api/auth/login"
        case .postRegister:
            return "/api/auth/register"
        case .getCurrentUser:
            return "/api/auth/me"
        case .getAllMovies:
            return "/api/movies"
        case .getMovieByID(let id):
            return "/api/movies/\(id)"
        case .postLikeMovie(let id):
            return "/api/movies/like/\(id)"
        case .postUnlikeMovie(let id):
            return "/api/movies/unlike/\(id)"
        case .getLikedMovies:
            return "/api/users/liked-movies"
        case .getLikedMovieIDs:
            return "/api/users/liked-movie-ids"
        case .putUserProfile:
            return "/api/users/profile"
        }
    }
    
    var fullURL: String {
        return "https://moviatask.cerasus.app" + path
    }
    
    
}
