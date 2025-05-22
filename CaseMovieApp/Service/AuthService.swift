//
//  AuthService.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

final class AuthService {
    static let shared = AuthService()
    
    func login(request: LoginRequest) async -> Result<AuthResponse, Error> {
        do {
            let response = try await NetworkManager.shared.createRequest(
                with: .postLogin,
                method: .POST,
                body: request,
                responseType: AuthResponse.self
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func signup(request: RegisterRequest) async -> Result<AuthResponse, Error> {
        do {
            let response = try await NetworkManager.shared.createRequest(
                with: .postRegister,
                method: .POST,
                body: request,
                responseType: AuthResponse.self
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func getCurrentUser(token: String) async -> Result<CurrentUser, Error> {
        do {
            let response = try await NetworkManager.shared.createRequest(
                with: .getCurrentUser,
                method: .GET,
                token: token,
                responseType: CurrentUser.self
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
