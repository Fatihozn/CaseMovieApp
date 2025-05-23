//
//  MovieItemView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//


import SwiftUI

struct AllMovieItemView: View {
    let movie: Movie
    
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
            width: (UIScreen.main.bounds.width - 48) / 2,
            height: 260
        )
        .clipped()
        .cornerRadius(12)
    }
}
