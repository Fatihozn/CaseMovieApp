//
//  LoginView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//


import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            Color.clrAppBackground.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Create Account")
                        .foregroundStyle(Color.clrAccent)
                        .font(.largeTitle.bold())
                    
                    MainTextField("Name", text: $viewModel.name)
                        .textContentType(.givenName)
                        .autocapitalization(.words)
                    
                    MainTextField("Surname", text: $viewModel.surname)
                        .textContentType(.familyName)
                        .autocapitalization(.words)
                    
                    MainTextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    
                    
                    PasswordField(password: $viewModel.password)
                    
                    PasswordField(password: $viewModel.confirmPassword)
                    
                    Spacer().frame(height: 32)
                    
                    Button(action: {
                        Task {
                            await viewModel.signUp()
                        }
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.isFormValid ? Color.clrAccent : Color.gray)
                            .cornerRadius(10)
                    }
                    .disabled(!viewModel.isFormValid)
                }
                .padding()
            }
        }
    }
}
