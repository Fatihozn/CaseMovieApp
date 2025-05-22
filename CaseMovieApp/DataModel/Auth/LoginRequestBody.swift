//
//  LoginRequest.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

struct LoginRequestBody: Codable {
    var email: String
    var password: String
}
