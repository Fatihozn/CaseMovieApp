//
//  ProfileViewModel.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//


import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEditing: Bool = false
    @Published var showMenu: Bool = false
    @Published var showSnackbar: Bool = false
    
    var isFormValid: Bool {
        !name.isEmpty &&
        !surname.isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }

    func updateProfile(token: String) async {
        let request = RegisterRequestBody(name: name, surname: surname, email: email, password: password)
        let response = await UserService.shared.updateProfile(request: request, token: token)
        
        switch response {
        case .success(let updateResponse):
            showSuccessSnackbar()
            print(updateResponse)
        case .failure(let error):
            ErrorManager.shared.showError(error.localizedDescription)
            print(error.localizedDescription)
        }
    }
    
    private func showSuccessSnackbar() {
        showSnackbar = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showSnackbar = false
        }
    }
}
