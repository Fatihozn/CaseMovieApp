//
//  MovieItemView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//


import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    let isFullWidth: Bool
    
    var body: some View {
        AsyncImage(url: URL(string: movie.poster_url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Color.gray.opacity(0.3)
            }
        }
        .frame(
            width: isFullWidth ? (UIScreen.main.bounds.width - 48) / 2 : 120,
            height: isFullWidth ? 260 : 180
        )
        .clipped()
        .cornerRadius(12)
    }
}
