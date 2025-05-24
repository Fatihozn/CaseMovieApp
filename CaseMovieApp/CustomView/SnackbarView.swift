//
//  SnackbarView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 24.05.2025.
//


import SwiftUI

struct SnackbarView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.clrTextPrimary)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.clrAccent)
            .cornerRadius(12)
            .shadow(radius: 5)
            .transition(.move(edge: .bottom).combined(with: .slide))
            .padding(.bottom, 30)
    }
}
