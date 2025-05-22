//
//  ProfileTextField.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 22.05.2025.
//

import SwiftUI

struct ProfileTextField: View {
    let title: String
    @Binding var isEditing: Bool
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text("\(title):")
                .foregroundColor(.clrTextSecondary)
            
            Spacer()
            
            if isEditing {
                TextField(title, text: $text)
                    .multilineTextAlignment(.trailing)
                    .autocapitalization(.none)
            } else {
                Text($text.wrappedValue)
                    .foregroundColor(.primary)
            }
        }
    }
}
