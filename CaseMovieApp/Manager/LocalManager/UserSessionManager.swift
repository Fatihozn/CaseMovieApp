//
//  UserSessionManager.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

final class UserSessionManager: ObservableObject {
    @AppStorage("authToken") private var token: String?
    
    @Published var currentUser: CurrentUserResponse?
    @Published var isLoggedIn: Bool = false
    
    init() {
        Task {
            await checkSession()
        }
    }
    
    func checkSession() async {
        guard let token else {
            DispatchQueue.main.async {
                self.isLoggedIn = false
            }
            return
        }
        print("token: \(token)")
        
        let result = await AuthService.shared.getCurrentUser(token: token)
        DispatchQueue.main.async {
            switch result {
            case .success(let user):
                self.currentUser = user
                self.isLoggedIn = true
            case .failure:
                self.token = nil
                self.isLoggedIn = false
            }
        }
    }
    
    func logout() {
        DispatchQueue.main.async {
            self.token = nil
            self.currentUser = nil
            self.isLoggedIn = false
        }
    }
    
    func setToken(_ newToken: String) {
        token = newToken
        Task {
            await checkSession()
        }
    }
    
    func getToken() -> String? {
        guard let token else {
            if isLoggedIn {
                ErrorManager.shared.showError("Please log in again.")
            }
            return nil
        }
        return token
    }
}
