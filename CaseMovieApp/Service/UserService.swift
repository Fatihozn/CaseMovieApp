//
//  UserService.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import Foundation

final class UserService {
    static let shared = UserService()
    
    private init() {}
    
    func updateProfile(request: RegisterRequestBody, token: String) async -> Result<UpdateUserResponse, Error> {
        do {
            let response: UpdateUserResponse = try await NetworkManager.shared.createRequest(
                with: .putUserProfile,
                method: .PUT,
                token: token,
                body: request
            )
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
