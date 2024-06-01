//
//  Routes.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import Foundation
import SwiftUI

protocol Route {
    func getScreen() -> any View
}

class DetailsRoute: Route {
    let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func getScreen() -> any View {
        return MovieDetailsScreen(movieId: movieId)
    }
}

class HomeRoute: Route {
    func getScreen() -> any View {
        return HomeScreen()
    }
}
