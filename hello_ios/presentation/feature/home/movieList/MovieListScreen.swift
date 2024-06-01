//
//  MovieListScreen.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import SwiftUI

struct MovieListScreen: View {
    @State var viewModel: MovieListViewModel = try! DiContainer.shared.resolve(type: MovieListViewModel.self)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if viewModel.movieList.isEmpty {
                        ProgressView()
                            .padding()
                    } else {
                        MovieSlider(
                            movieList: Array(viewModel.movieList.prefix(10)),
                            onClickedMovieItem: {
                                viewModel.onClickedMovieItem(movieId: $0.id)
                            }
                        )
                        .padding(.bottom)
                        MovieCategoryView(title: "Newly Released", movies: viewModel.movieList, onMovieClick: viewModel.onClickedMovieItem)
                        MovieCategoryView(title: "Most Popular Movies", movies: viewModel.movieList, onMovieClick: viewModel.onClickedMovieItem)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
        }
    }
}

fileprivate struct MovieCategoryView: View {
    let title: String
    let movies: [MovieListItemModel]
    let onMovieClick: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(movies) { movie in
                        MovieCard(movie: movie, onCardClicked: { onMovieClick(movie.id) })
                    }
                }
            }
        }
        .padding(.bottom)
    }
}

fileprivate struct MovieCard: View {
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
        .padding(.horizontal, 10)
        .onTapGesture {
            onCardClicked()
        }
    }
}

#Preview {
    MovieListScreen()
}
