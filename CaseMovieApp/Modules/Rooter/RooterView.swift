//
//  RootView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct RooterView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var errorManager: ErrorManager
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            Group {
                if sessionManager.isLoggedIn {
                    MainTabView()
                        .tint(.clrAccent)
                } else {
                    LoginView()
                }
            }
            .animation(.easeInOut, value: sessionManager.isLoggedIn)
            
            if showSplash {
                Image(.splash)
            }
            
            if let message = errorManager.errorMessage {
                CustomAlertView(
                    title: errorManager.errorTitle,
                    message: message,
                    dismissAction: {
                        errorManager.clear()
                    }
                )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut) {
                    showSplash = false
                }
            }
        }
    }
}
