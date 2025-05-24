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
    
    func fetchMovies() async {
        let response = await MovieService.shared.fetchMovies()
        switch response {
        case .success(let movies):
            allMovies = movies
            topTenMovies = Array(movies.sorted { $0.rating > $1.rating }.prefix(10))
        case .failure(let error):
            ErrorManager.shared.showError(error.localizedDescription)
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}
