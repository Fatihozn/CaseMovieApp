//
//  CaseMovieAppApp.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import SwiftUI

@main
struct CaseMovieAppApp: App {
    @StateObject private var sessionManager = UserSessionManager()
    
    var body: some Scene {
        WindowGroup {
            RooterView()
                .environmentObject(ErrorManager.shared)
                .environmentObject(sessionManager)
                .accentColor(.clrAccent)
        }
    }
}
