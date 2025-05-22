//
//  HomeViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var likedMovies: [Movie] = []
    @Published var recommendedMovies: [Movie] = []
    @Published var likedIds = Set<Int>()
    
    func fetchMovies(token: String) async {
        await fetcLikedMovies(token: token)
        likedIds = Set(likedMovies.map { $0.id })
        
        let response = await MovieService.shared.fetchMovies()
        switch response {
        case .success(let movies):
            recommendedMovies = movies.filter { !likedIds.contains($0.id) }
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
    
    private func fetcLikedMovies(token: String) async {
        let response = await MovieService.shared.fetchLikedMovies(token: token)
        switch response {
        case .success(let likedMovies):
            self.likedMovies = likedMovies
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
    
}
