//
//  hello_iosApp.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI
import SwiftData

@main
struct MainApp: App {
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: FavouriteMovieDbModel.self)
        } catch {
            fatalError("Failed to create ModelContainer for FavouriteMovieDbModel.")
        }
        DiModule.shared.injectDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            AppRouter()
        }
        .modelContainer(modelContainer)
    }
}
