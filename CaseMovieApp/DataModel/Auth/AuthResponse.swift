//
//  LoginResponse.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

struct AuthResponse: Codable {
    var message: String
    var token: String?
    var user: UserResponse?
}

