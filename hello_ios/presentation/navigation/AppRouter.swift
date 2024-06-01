//
//  AppRouter.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import SwiftUI

struct AppRouter: View {
    @State var navigationViewModel: NavigationViewModel = try! DiContainer.shared.resolve(type: NavigationViewModel.self)
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.navigationPath) {
            HomeScreen()
                .navigationDestination(for: Route.self) { route in
                    route.view()
                }
        }
        
    }
}
