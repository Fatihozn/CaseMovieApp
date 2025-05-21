//
//  MainTextField.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 21.05.2025.
//

import SwiftUI

struct MainTextField: View {
    let placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .padding()
            .background(Color.clrCard)
            .cornerRadius(10)
        
    }
}
