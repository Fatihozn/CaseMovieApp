//
//  ProfileTextField.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct ProfileTextField: View {
    let title: String
    var isSecure: Bool = false
    @Binding var isEditing: Bool
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text("\(title):")
                .foregroundColor(.clrTextSecondary)
            
            Spacer()
            
            if isEditing {
                if isSecure {
                    SecureField(title, text: $text)
                        .font(.body)
                        .multilineTextAlignment(.trailing)
                        .autocapitalization(.none)
                } else {
                    TextField(title, text: $text)
                        .font(.body)
                        .multilineTextAlignment(.trailing)
                        .autocapitalization(.none)
                }
            } else {
                Text(isSecure ? String(repeating: "•", count: text.count) : text)
                    .font(isSecure ? .title : .body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}
