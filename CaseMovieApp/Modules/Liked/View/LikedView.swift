//
//  LikedView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 23.05.2025.
//

import SwiftUI

struct LikedView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @StateObject private var viewModel = LikedViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let width = geo.size.width
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(viewModel.filteredMovies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieItemView(movie: movie, width: ((width - 48) / 3))
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                .background(Image(.appBackground))
                .navigationTitle("Liked Movies")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText, prompt: "Search liked movies")
                .onAppear {
                    Task {
                        if let token = sessionManager.getToken() {
                            await viewModel.fetchLikedMovies(token: token)
                        }
                    }
                }
            }
         
        }
    }
}
