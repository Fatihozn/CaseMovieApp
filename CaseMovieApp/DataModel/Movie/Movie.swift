//
//  Movie.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: Int
    var title: String
    var year: Int
    var rating: Float
    var actors: [String]
    var category: String
    var poster_url: String
    var description: String
}
