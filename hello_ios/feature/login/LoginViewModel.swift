//
//  LoginViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import Foundation
class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published private(set) var emailError: String?
    @Published private(set) var passwordError: String?
    
    func onEmailChange(email: String) {
        print("Email changed to \(email)")
        self.email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        emailError = EmailValidator.validate(email: email)
    }
    
    func onPasswordChange(password: String) {
        print("Password changed to \(password)")
        self.password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        passwordError = PasswordValidator.validate(password: password)
    }
    
    func onLoginButtonTap() {
        emailError = EmailValidator.validate(email: email)
        passwordError = PasswordValidator.validate(password: password)
        
        if emailError == nil && passwordError == nil {
            print("Login success")
            //TODO: Navigate to home screen
        } else {
            print("Login failed")
        }
    }
    
}
