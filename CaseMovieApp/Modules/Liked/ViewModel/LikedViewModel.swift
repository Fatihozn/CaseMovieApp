//
//  LikedViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 23.05.2025.
//


import Foundation
import SwiftUI

@MainActor
class LikedViewModel: ObservableObject {
    @Published var allLikedMovies: [Movie] = []
    @Published var searchText: String = ""
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return allLikedMovies
        } else {
            return allLikedMovies.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func fetchLikedMovies(token: String) async {
        let response = await MovieService.shared.fetchLikedMovies(token: token)
        switch response {
        case .success(let movies):
            self.allLikedMovies = movies
        case .failure(let error):
            print("❌ Liked fetch error: \(error.localizedDescription)")
        }
    }
}
