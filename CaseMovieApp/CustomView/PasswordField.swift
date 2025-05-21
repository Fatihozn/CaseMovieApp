//
//  PasswordField.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//


import SwiftUI

struct PasswordField: View {
    @State private var isPasswordVisible = false
    @Binding var password: String
    var body: some View {
        HStack {
            Group {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                        .textContentType(.password)
                } else {
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                }
            }
            
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.clrCard)
        .cornerRadius(10)
    }
}
