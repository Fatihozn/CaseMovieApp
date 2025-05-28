//
//  String+Ext.swift
//  CaseMovieApp
//
//  Created by Fatih Özen on 28.05.2025.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
