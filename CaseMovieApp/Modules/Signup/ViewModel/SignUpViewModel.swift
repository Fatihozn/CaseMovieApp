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

    var isFormValid: Bool {
        !name.isEmpty &&
        !surname.isEmpty &&
        email.isValidEmail &&
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
            ErrorManager.shared.showError(error.localizedDescription)
            print("❌ Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func showAlert() {
        var message = ""
        if name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            message = "Please fill all fields."
        } else if !email.isValidEmail {
            message = "Please fill valid email."
        } else if password.count < 6 {
            message = "Password must be at least 6 characters long."
        } else {
            message = "Passwords do not match."
        }
        
        ErrorManager.shared.showError(title: "Info", message)
    }
}
