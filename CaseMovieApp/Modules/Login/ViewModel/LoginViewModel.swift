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
        email.isValidEmail &&
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
            ErrorManager.shared.showError(error.localizedDescription)
            print("❌ Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func showAlert() {
        var message = ""
        if email.isEmpty || password.isEmpty {
            message = "Please fill all fields."
        } else if !email.isValidEmail {
            message = "Please fill valid email."
        } else {
            message = "Password must be at least 6 characters long."
        }
        
        ErrorManager.shared.showError(title: "Info", message)
    }
}
