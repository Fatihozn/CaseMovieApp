//
//  MainTabView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 23.05.2025.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home
        case liked
        case profile
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            LikedView()
                .tabItem {
                    Label("Liked", systemImage: "heart.fill")
                }
                .tag(Tab.liked)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
        .accentColor(.accentColor)
    }
}
