//
//  ProfileView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionManager: UserSessionManager

    var body: some View {
        VStack {
            if let user = sessionManager.currentUser {
                Text("Welcome \(user.name)")
            } else {
                Text("No user info")
            }
        }
    }
}
