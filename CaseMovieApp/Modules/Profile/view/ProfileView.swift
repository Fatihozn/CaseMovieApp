//
//  ProfileView.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack {
                    
                    Form {
                        Section(header: Text("Profile Info")) {
                            ProfileTextField(title: "Name", isEditing: $viewModel.isEditing, text: $viewModel.name)
                            ProfileTextField(title: "Surname", isEditing: $viewModel.isEditing, text: $viewModel.surname)
                            ProfileTextField(title: "Email", isEditing: $viewModel.isEditing, text: $viewModel.email)
                            ProfileTextField(title: "Password", isSecure: true, isEditing: $viewModel.isEditing, text: $viewModel.password)
                        }
                    }
                    .frame(height: 250)
                    .scrollDisabled(true)
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    
                    if viewModel.isEditing {
                        Button {
                            Task {
                                if let token = sessionManager.getToken() {
                                    viewModel.isEditing = false
                                    await viewModel.updateProfile(token: token)
                                    await sessionManager.checkSession()
                                }
                            }
                        } label: {
                            Text("Save")
                                .foregroundColor(.clrTextPrimary)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(viewModel.isFormValid ? Color.clrAccent : .gray)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .disabled(!viewModel.isFormValid)
                    }
                    
                    Spacer()
                }
                
                if viewModel.showSnackbar {
                    SnackbarView(message: "Succeded")
                        .animation(.easeInOut, value: viewModel.showSnackbar)
                        .zIndex(1)
                }
                
            }
            .background(Color.clrAppBackground)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.isEditing {
                        Button {
                            viewModel.isEditing = false
                            viewModel.password = ""
                        } label: {
                            Image(systemName: "xmark")
                        }
                        
                    } else {
                        Menu {
                            Button("Edit") {
                                viewModel.isEditing = true
                            }
                            Button("Logout", role: .destructive) {
                                sessionManager.logout()
                            }
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
            .onAppear {
                if let currentUser = sessionManager.currentUser {
                    viewModel.name = currentUser.name
                    viewModel.surname = currentUser.surname
                    viewModel.email = currentUser.email
                    viewModel.password = ""
                } else {
                    Task {
                        await sessionManager.checkSession()
                    }
                }
            }
        }
        
    }
}

