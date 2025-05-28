//
//  AllMovieItemView 2.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 23.05.2025.
//

import SwiftUI
import Kingfisher

struct MovieItemView: View {
    let movie: Movie
    var width: CGFloat = 120
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                .frame(
                    width: width,
                    height: width * 1.5
                )
                .overlay(
                    VStack {
                        HStack {
                            Label(String(format: "%.1f", movie.rating), systemImage: "star.fill")
                                .font(.caption2)
                                .padding(6)
                                .background(Color.black.opacity(0.7))
                                .foregroundColor(.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Spacer()
                        }
                        Spacer()
                    }
                )
            
            Text(movie.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(2)
                .padding(.horizontal, 4)
                .frame(width: width, height: 40)
                .padding(.vertical, 4)
                .background(LinearGradient(colors: [.clear, .black.opacity(0.7), .black], startPoint: .top, endPoint: .bottom))
        }
        .clipped()
        .cornerRadius(12)
        
    }
}
