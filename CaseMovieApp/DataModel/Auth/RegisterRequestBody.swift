//
//  RegisterRequest.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import Foundation

struct RegisterRequestBody: Codable {
    var name: String
    var surname: String
    var email: String
    var password: String
}
