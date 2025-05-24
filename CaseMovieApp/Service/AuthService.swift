//
//  AuthService.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

final class AuthService {
    static let shared = AuthService()
    
    func login(request: LoginRequestBody) async -> Result<AuthResponse, Error> {
        do {
            let response: AuthResponse = try await NetworkManager.shared.createRequest(
                with: .postLogin,
                method: .POST,
                body: request
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func signup(request: RegisterRequestBody) async -> Result<AuthResponse, Error> {
        do {
            let response: AuthResponse = try await NetworkManager.shared.createRequest(
                with: .postRegister,
                method: .POST,
                body: request
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func getCurrentUser(token: String) async -> Result<CurrentUserResponse, Error> {
        do {
            let response: CurrentUserResponse = try await NetworkManager.shared.createRequest(
                with: .getCurrentUser,
                method: .GET,
                token: token
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
