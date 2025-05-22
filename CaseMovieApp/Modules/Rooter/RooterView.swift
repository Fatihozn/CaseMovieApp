//
//  RootView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct RooterView: View {
    @EnvironmentObject var sessionManager: UserSessionManager

    var body: some View {
        Group {
            //MARK: - splash view eklenebilir
            if sessionManager.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        .animation(.easeInOut, value: sessionManager.isLoggedIn)
    }
}
