//
//  MovieSlider.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation
import SwiftUI

struct MovieSlider: View {
    @State private var selectedTab = 0
    
    let movieList: [MovieListItemModel]
    let onClickedMovieItem: (MovieListItemModel) -> Void
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            movieTabView
            movieInfoOverlay
            pageIndicator
                .padding()
                .padding(.trailing, 10)
        }
        .frame(height: 250)
        .cornerRadius(20)
        .onTapGesture {
            onClickedMovieItem(movieList[selectedTab])
        }
    }
    
    private var movieTabView: some View {
        TabView(selection: self.$selectedTab) {
            ForEach(self.movieList.indices, id: \.self) { index in
                AsyncImage(url: URL(string: movieList[index].poster)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 240)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    private var movieInfoOverlay: some View {
        ZStack(alignment: .bottomLeading) {
            glassBackground
            movieInfo
                .padding()
            Spacer()
        }.frame(height: 100)
    }
    
    private var glassBackground: some View {
        VisualEffectView(
            effect: UIBlurEffect(style: .systemUltraThinMaterial)
        ).edgesIgnoringSafeArea(.all)
    }
    
    private var movieInfo: some View {
        HStack {
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
            }
            Spacer()
        }
    }
    
    private var pageIndicator: some View {
        HStack {
            ForEach(self.movieList.indices, id: \.self) { index in
                if self.selectedTab == index {
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 18, height: 6)
                } else {
                    Circle()
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 6, height: 6)
                }
            }
        }
    }
}


#Preview {
    MovieSlider(
        movieList: [
            MovieListItemModel(
                id: 1,
                title: "Movie 1",
                poster: "https://via.placeholder.com/150",
                rating: 4,
                releaseYear: 2024
            ),
            MovieListItemModel(
                id: 2,
                title: "Movie 2",
                poster: "https://via.placeholder.com/150",
                rating: 4,
                releaseYear: 2024
            ),
            MovieListItemModel(
                id: 3,
                title: "Movie 3",
                poster: "https://via.placeholder.com/150",
                rating: 4,
                releaseYear: 2024
            )
        ],
        onClickedMovieItem: {_ in}
    )
}
