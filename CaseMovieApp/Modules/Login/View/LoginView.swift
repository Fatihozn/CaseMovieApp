//
//  ContentView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @StateObject private var viewModel = LoginViewModel()
    
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
                        if viewModel.isFormValid {
                            Task {
                                if let token = await viewModel.login() {
                                    sessionManager.setToken(token)
                                }
                            }
                        } else {
                            viewModel.showAlert()
                        }
                        
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.clrAccent)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        
    }
}
