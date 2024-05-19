//
//  EmailValidator.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import Foundation
class EmailValidator {
    static func validate(email: String) -> String? {
        if email.isEmpty {
            return "Email is required"
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPred.evaluate(with: email) {
            return "Email is invalid"
        }
        return nil
    }
    
    static func isValid(email: String) -> Bool {
        return validate(email: email) == nil
    }
}
