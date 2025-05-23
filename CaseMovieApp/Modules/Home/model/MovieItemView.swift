//
//  AllMovieItemView 2.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 23.05.2025.
//

import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    var width: CGFloat = 120
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                width: width,//isFullWidth ? (UIScreen.main.bounds.width - 48) / 2 : 120,
                height: width * 1.5 //isFullWidth ? 260 : 180
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
