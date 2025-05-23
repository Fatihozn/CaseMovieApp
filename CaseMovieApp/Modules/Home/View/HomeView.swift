//
//  HomeView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedMovie: Movie?
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let width = geo.size.width
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Top 10 Movies
                        VStack(alignment: .leading) {
                            Text("TOP 10")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundStyle(Color.clrTextPrimary)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.flexible())], spacing: 12) {
                                    ForEach(viewModel.topTenMovies) { movie in
                                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                                            MovieItemView(movie: movie)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // MARK: All Movies
                        VStack(alignment: .leading) {
                            Text("ALL MOVIES")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundStyle(Color.clrTextPrimary)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(viewModel.filteredMovies) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                                        MovieItemView(movie: movie, width: (width - 36) / 2 )
                                    }
                                }
                            }
                            .padding(.horizontal, 12)
                        }
                    }
                    .padding(.vertical)
                }
                .background(Image(.appBackground))
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText, prompt: "Search movies")
                .task {
                    if let token = sessionManager.getToken() {
                        await viewModel.fetchMovies(token: token)
                    }
                }
            }
        }
    }
}
