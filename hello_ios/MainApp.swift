//
//  hello_iosApp.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI

@main
struct MainApp: App {
    
    init() {
        DiModule.shared.injectDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            MovieListScreen()
        }
    }
}
