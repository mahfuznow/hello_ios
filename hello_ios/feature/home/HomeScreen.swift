//
//  HomeScreen.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            MovieListScreen()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            MovieSearchScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            Text("Watchlist")
                .tabItem {
                    Label("Watchlist", systemImage: "bookmark")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


