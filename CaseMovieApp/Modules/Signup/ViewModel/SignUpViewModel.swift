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
        email.contains("@") &&
        password.count >= 6 &&
        password == confirmPassword
    }

    func signUp() async {
        let request = RegisterRequest(name: name, surname: surname, email: email, password: password)
        let response = await AuthService.shared.signup(request: request)
        switch response {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error.localizedDescription)
        }
        print("register response geldi")
    }
}
