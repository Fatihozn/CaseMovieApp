//
//  MovieDetailView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @StateObject private var viewModel = MovieDetailViewModel()
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color.clrAppBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 16) {
                    
                    KFImage(URL(string: movie.poster_url))
                        .placeholder {
                            ZStack {
                                Color.gray.opacity(0.3)
                                Image(systemName: "film")
                                    .resizable()
                                    .frame(width: 50, height: 60)
                            }
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 225)
                        .cornerRadius(12)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("📅 \(String(movie.year))")
                            .foregroundColor(.clrTextSecondary)
                            .padding(.top)
                        
                        Text("🎬 \(movie.category)")
                            .foregroundColor(.clrTextSecondary)
                            .padding(.vertical)
                        
                        Text("⭐️ \(String(format: "%.1f", movie.rating))")
                            .foregroundColor(.clrTextSecondary)
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("👥 Actors:")
                        .font(.headline)
                        .foregroundColor(.clrTextPrimary)
                    
                    ForEach(movie.actors, id: \.self) { actor in
                        Text("• \(actor)")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.clrTextPrimary)
                        .padding(.top, 16)
                    
                    Text(movie.description)
                        .foregroundColor(.clrTextSecondary)
                        .font(.body)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(movie.title)
            .onAppear {
                Task {
                    if let token = sessionManager.getToken() {
                        await viewModel.getLikedMovieIDs(id: movie.id, token: token)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            if let token = sessionManager.getToken() {
                                if viewModel.isLikeMovie {
                                    await viewModel.unlikeMovie(id: movie.id, token: token)
                                } else {
                                    await viewModel.likeMovie(id: movie.id, token: token)
                                }
                            }
                        }
                    } label: {
                        if viewModel.isLikeMovie {
                            Image(systemName: "heart.fill")
                                .font(.title2)
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart")
                                .font(.title2)
                        }
                    }
                }
            }
        }
    }
}
