//
//  MovieDetailView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: movie.poster_url)){ phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    Color.gray.opacity(0.3)
                }
            }
            .frame(width: 200, height: 300)
            .cornerRadius(16)
        }
        .navigationTitle(movie.title)
    }
}
