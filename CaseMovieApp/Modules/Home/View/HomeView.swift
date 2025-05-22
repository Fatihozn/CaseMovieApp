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
            ZStack {
                Color.clrAppBackground.edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Liked Movies
                        VStack(alignment: .leading) {
                            Text("Liked")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundStyle(Color.clrAccent)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 12) {
                                    ForEach(viewModel.likedMovies) { movie in
                                        NavigationLink(destination: MovieDetailView(movie: movie, likedMovies: viewModel.likedIds)) {
                                            MovieItemView(movie: movie, isFullWidth: false)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // MARK: Other Movies
                        VStack(alignment: .leading) {
                            Text("Other")
                                .font(.headline)
                                .padding(.horizontal)
                                .foregroundStyle(Color.clrAccent)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(viewModel.recommendedMovies) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie, likedMovies: viewModel.likedIds)) {
                                        MovieItemView(movie: movie, isFullWidth: true)
                                    }
                                }
                            }
                            .padding(.horizontal, 12)
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person")
                                .font(.title2)
                        }
                    }
                }
                .task {
                    if let token = sessionManager.getToken() {
                        await viewModel.fetchMovies(token: token)
                    }
                }
            }
        }
    }
}
