//
//  MovieSlider.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

import Foundation
import SwiftUI

struct MovieSlider: View {
    @State private var selectedTab = 0
    
    let movieList: [MovieListItemModel]
    
    var body: some View {
        VStack {
            // TabView
            TabView(selection: self.$selectedTab) {
                ForEach(self.movieList.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: movieList[index].poster)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 225)
                            .clipped()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(self.movieList.indices, id: \.self) { index in
                    if self.selectedTab == index {
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 30, height: 10)
                    } else {
                        Circle()
                            .fill(.gray)
                            .frame(width: 30, height: 10)
                    }
                }
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    MovieSlider(movieList: [MovieListItemModel(id: 1, title: "Movie 1", poster: "https://via.placeholder.com/150", rating: 4, releaseYear: 2024), MovieListItemModel(id: 2, title: "Movie 2", poster: "https://via.placeholder.com/150", rating: 4,releaseYear: 2024), MovieListItemModel(id: 3, title: "Movie 3", poster: "https://via.placeholder.com/150", rating: 4, releaseYear: 2024)])
}
