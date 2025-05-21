//
//  ContentView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.clrAppBackground.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 24) {
                    Text("Welcome")
                        .foregroundStyle(Color.clrAccent)
                        .font(.largeTitle.bold())
                    
                    MainTextField("Email", text: $viewModel.email)
                    
                    PasswordField(password: $viewModel.password)
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text("Sign up")
                                .underline()
                                .foregroundColor(.clrAccent)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        Task {
                            await viewModel.login()
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.isFormValid ? Color.clrAccent : .gray)
                            .cornerRadius(10)
                    }
                    .disabled(!viewModel.isFormValid)
                }
                .padding()
            }
        }
        
    }
}
