//
//  HomeScreen.swift
//  hello_ios
//
//  Created by BS1002 on 19/5/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var viewModel = HomeViewModel.shared
    
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
            FavouriteMoviesScreen()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


