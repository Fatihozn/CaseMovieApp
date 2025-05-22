//
//  UserSessionManager.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

final class UserSessionManager: ObservableObject {
    @AppStorage("authToken") private var token: String?
    
    @Published var currentUser: CurrentUser?
    @Published var isLoggedIn: Bool = false

    init() {
        Task {
            await checkSession()
        }
    }

    func checkSession() async {
        guard let token else {
            isLoggedIn = false
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
        token = nil
        currentUser = nil
        isLoggedIn = false
    }

    func setToken(_ newToken: String) {
        token = newToken
        Task {
            await checkSession()
        }
    }
    
    func getToken() -> String? {
        guard let token else {
            return nil
        }
        return token
    }
}
