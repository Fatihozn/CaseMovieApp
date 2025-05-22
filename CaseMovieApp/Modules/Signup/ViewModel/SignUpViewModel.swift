//
//  SignUpViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?

    var isFormValid: Bool {
        !name.isEmpty &&
        !surname.isEmpty &&
        email.contains("@") &&
        password.count >= 6 &&
        password == confirmPassword
    }

    func signUp() async -> String? {
        let request = RegisterRequestBody(name: name, surname: surname, email: email, password: password)
        let response = await AuthService.shared.signup(request: request)
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
