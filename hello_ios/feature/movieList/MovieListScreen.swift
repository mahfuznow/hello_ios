//
//  MovieListScreen.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import Foundation
import SwiftUI

struct MovieListScreen : View {
    @State var viewModel: MovieListViewModel = try! DiContainer.shared.resolve(type: MovieListViewModel.self)
    
    var body: some View {
        NavigationView {
            VStack {
                _getDetailsNavigation()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        if(viewModel.movieList.isEmpty) {
                            ProgressView()
                        }
                        else {
                            MovieSlider(movieList: Array(viewModel.movieList[1...3]))
                            _newlyReleased()
                            _mostPopularMovies()
                        }
                    }
                }
            }.navigationTitle("Movies")
        }
    }
    
    private func _getDetailsNavigation() -> some View {
        NavigationLink(
            destination: MovieDetailsScreen(movieId: viewModel.selectedMovieId),
            isActive: self.$viewModel.isMovieDetailsPresented,
            label: {
                EmptyView()
            })
    }
    
    private func _newlyReleased() -> some View {
        VStack {
            Text("Newly Released").font(.title2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.movieList) { movie in
                        MovieCard(
                            movie: movie,
                            onCardClicked: {
                                viewModel.onClickedMovieItem(movieId: movie.id)
                            }
                        )
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
        }
    }
    
    private func _mostPopularMovies() -> some View {
        VStack {
            Text("Most Popular Movies").font(.title2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.movieList) { movie in
                        MovieCard(
                            movie: movie,
                            onCardClicked: {
                                viewModel.onClickedMovieItem(movieId: movie.id)
                            }
                        )
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
        }
    }
}

struct MovieCard: View {
    var movie: MovieListItemModel
    var onCardClicked: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 150)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .padding(.top, 5)
            
            Text("\(movie.releaseYear)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 100)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .onTapGesture {
            onCardClicked()
        }
    }
}

#Preview {
    MovieListScreen()
}
