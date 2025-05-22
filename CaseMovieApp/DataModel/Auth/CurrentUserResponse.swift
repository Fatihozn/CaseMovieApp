//
//  CurrentUser.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import Foundation

struct CurrentUserResponse: Codable {
    var _id: String
    var name: String
    var surname: String
    var email: String
    var likedMovies: [Int]?
    var createdAt: String
    var updatedAt: String
    var __v: Int
}
