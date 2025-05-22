//
//  LoginViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//


import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?

    var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }

    func login() async -> String? {
        let request = LoginRequestBody(email: email, password: password)
        let response = await AuthService.shared.login(request: request)
        switch response {
        case .success(let response):
            if let token = response.token {
                print("token: \(token)")
                return token
            }
        case .failure(let error):
            errorMessage = error.localizedDescription
            print("❌ Error: \(error.localizedDescription)")
        }
        return nil
    }
}
