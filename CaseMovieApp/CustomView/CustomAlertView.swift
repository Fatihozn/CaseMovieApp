//
//  CustomAlertView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 24.05.2025.
//


import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let buttonTitle: String = "OK"
    var dismissAction: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)

                Button(action: {
                    dismissAction?()
                }) {
                    Text(buttonTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.clrAccent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color(.systemGray6).opacity(0.95))
            .cornerRadius(20)
            .padding(.horizontal, 32)
        }
    }
}
