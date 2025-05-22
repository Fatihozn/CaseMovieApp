//
//  LikeUnLikeResponse.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import Foundation

struct LikeUnLikeResponse: Codable {
    var message: String
    var likedMovies: [Int]?
}
