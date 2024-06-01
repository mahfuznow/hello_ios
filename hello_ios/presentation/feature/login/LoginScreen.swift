//
//  LoginScreen.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                _getLoginView()
                _getHomeNavigation()
            }.padding(32)
                .navigationTitle("Login")
        }
    }
    
    private func _getLoginView() -> some View {
        VStack {
            _logoView()
            _getEmailView()
            _getPasswordView()
            _getLoginButtonView()
        }
    }
    
    private func _getHomeNavigation() -> some View {
        NavigationLink(
            destination: HomeScreen(),
            isActive: $viewModel.shouldNavigateToHome,
            label: {
                EmptyView()
            })
    }
    
    private func _logoView() -> some View {
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .padding(.bottom, 32)
    }
    
    
    private func _getEmailView() -> some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.all, 10)
                .onChange(of: viewModel.email) {
                    viewModel.onEmailChange(email: viewModel.email)
                }
            if let emailError = viewModel.emailError {
                Text(emailError)
                    .foregroundColor(.red)
                    .padding(0)
            }
        }
    }
    
    private func _getPasswordView() -> some View {
        VStack {
            SecureField("Password", text: $viewModel.password)
                .disableAutocorrection(true)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.all, 10)
                .onChange(of: viewModel.password) {
                    viewModel.onPasswordChange(password:viewModel.password)
                }
            if let passwordError = viewModel.passwordError {
                Text(passwordError)
                    .foregroundColor(.red)
            }
        }
    }
    
    private func _getLoginButtonView() -> some View {
        Button(action: {
            viewModel.onLoginButtonTap()
        }) {
            Text("Login")
                .foregroundColor(.white)
                .font(.title3)
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
                .background(Color.blue)
                .cornerRadius(10)
            
        }
        .padding()
    }
}


#Preview {
    LoginScreen()
}
