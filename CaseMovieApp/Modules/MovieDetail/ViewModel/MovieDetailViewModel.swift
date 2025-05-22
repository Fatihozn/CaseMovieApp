//
//  MovieDetailViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

@MainActor
final class MovieDetailViewModel: ObservableObject {
    @Published var isLikeMovie: Bool = false
    
    func likeMovie(id: Int, token: String) async {
        let response = await MovieService.shared.likeMovie(id: id, token: token)
        switch response {
        case .success(_):
            isLikeMovie = true
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
    
    func unlikeMovie(id: Int, token: String) async {
        let response = await MovieService.shared.unLikeMovie(id: id, token: token)
        switch response {
        case .success(_):
            isLikeMovie = false
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}
