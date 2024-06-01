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
        ZStack(alignment: .bottomTrailing) {
            // TabView
            TabView(selection: self.$selectedTab) {
                ForEach(self.movieList.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: movieList[index].poster)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 240)
                            .cornerRadius(10)                    } placeholder: {
                        ProgressView()
                    }.padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            //Information with blur background
            ZStack(alignment: .bottomLeading) {
                VStack {}.frame(width: 400)
                    .frame(height: 120)
                    .background(.background.opacity(0.6))
                    .blur(radius: 1)
                
                HStack() {
                    VStack(alignment: .leading) {
                        Text(movieList[selectedTab].title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("Rating: \(movieList[selectedTab].rating)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Release Year: \(movieList[selectedTab].releaseYear)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }.padding()
                    Spacer()
                }.padding()
            }
            
            HStack {
                ForEach(self.movieList.indices, id: \.self) { index in
                    if self.selectedTab == index {
                        Capsule()
                            .fill(.foreground)
                            .frame(width: 18, height: 6)
                    } else {
                        Circle()
                            .fill(.foreground.opacity(0.8))
                            .frame(width: 6, height: 6)
                    }
                }
            }.padding(.bottom, 20)
                .padding(.trailing, 30)
        }
        .frame(height: 250)
    }
}

#Preview {
    MovieSlider(movieList: [MovieListItemModel(id: 1, title: "Movie 1", poster: "https://via.placeholder.com/150", rating: 4, releaseYear: 2024), MovieListItemModel(id: 2, title: "Movie 2", poster: "https://via.placeholder.com/150", rating: 4,releaseYear: 2024), MovieListItemModel(id: 3, title: "Movie 3", poster: "https://via.placeholder.com/150", rating: 4, releaseYear: 2024)])
}
