//
//  HttpError.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 24.05.2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case apiError(message: String)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid server response."
        case .apiError(let message):
            return message
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
