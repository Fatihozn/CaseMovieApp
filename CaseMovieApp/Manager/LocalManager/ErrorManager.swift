//
//  ErrorManager.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 24.05.2025.
//


import Foundation
import SwiftUI


final class ErrorManager: ObservableObject {
    static let shared = ErrorManager()
    @Published var errorMessage: String? = nil
    
    private init() { }

    func showError(_ message: String) {
        DispatchQueue.main.async {
            self.errorMessage = message.replacingOccurrences(of: #" ?\([^)]+\)"#, with: "", options: .regularExpression)
        }
    }

    func clear() {
        errorMessage = nil
    }
}
