//
//  HomeViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var allMovies: [Movie] = []
    @Published var topTenMovies: [Movie] = []
    @Published var searchText: String = ""
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return allMovies
        } else {
            return allMovies.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func fetchMovies(token: String) async {
        
        let response = await MovieService.shared.fetchMovies()
        switch response {
        case .success(let movies):
            allMovies = movies
            topTenMovies = Array(movies.sorted { $0.rating > $1.rating }.prefix(10))
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
    
//    private func fetcLikedMovies(token: String) async {
//        let response = await MovieService.shared.fetchLikedMovies(token: token)
//        switch response {
//        case .success(let likedMovies):
//            self.likedMovies = likedMovies
//        case .failure(let error):
//            print("❌ Error: \(error.localizedDescription)")
//        }
//    }
    
}
