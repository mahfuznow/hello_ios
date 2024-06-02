//
//  NavigationViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import SwiftUI
import Combine

@Observable
class NavigationViewModel {
    
    static let shared = NavigationViewModel()
    
    var navigationPath = NavigationPath()
    
    func navigateTo(screen: Route) {
        navigationPath.append(screen)
    }
    
    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}

