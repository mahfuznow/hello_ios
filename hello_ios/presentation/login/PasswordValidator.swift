//
//  PasswordValidator.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import Foundation

class PasswordValidator {
    static func validate(password: String) -> String? {
        if password.isEmpty {
            return "Password is required"
        }
        if password.contains(" ") {
            return "Password must not contain spaces"
        }
        if password.rangeOfCharacter(from: .letters) == nil {
            return "Password must contain at least one letter"
        }
        if password.rangeOfCharacter(from: .decimalDigits) == nil {
            return "Password must contain at least one digit"
        }
        if password.rangeOfCharacter(from: .uppercaseLetters) == nil {
            return "Password must contain at least one uppercase letter"
        }
        if password.rangeOfCharacter(from: .lowercaseLetters) == nil {
            return "Password must contain at least one lowercase letter"
        }
        if password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|;':\",./<>?\\")) == nil {
            return "Password must contain at least one special character"
        }
        if password.count < 8 {
            return "Password must be at least 8 characters"
        }
        return nil
    }
    
    static func isValid(password: String) -> Bool {
        return validate(password: password) == nil
    }
}
