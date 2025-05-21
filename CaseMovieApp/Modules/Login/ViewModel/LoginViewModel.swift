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

    var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }

    func login() async {
        let request = LoginRequest(email: email, password: password)
        let response = await AuthService.shared.login(request: request)
        switch response {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error.localizedDescription)
        }
        print("login response geldi")
    }
}
