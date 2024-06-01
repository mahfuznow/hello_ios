//
//  Screen.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import SwiftUI

enum Route: Hashable {
    case login
    case movieList
    case movieDetails(id: Int)  // Example of passing an argument
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .login:
            LoginScreen()
        case .movieList:
            MovieListScreen()
        case .movieDetails(let id):
            MovieDetailsScreen(movieId: id)
        }
    }
}
