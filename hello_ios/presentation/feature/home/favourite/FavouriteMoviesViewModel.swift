//
//  FavouriteMovieViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

@Observable
class FavouriteMoviesViewModel {
    var movieList: [MovieListItemModel] = []

    private var movieRepository: MovieRepository
    private var navigationViewModel: NavigationViewModel
    
    init(
        movieRepository: MovieRepository,
        navigationViewModel: NavigationViewModel
    ) {
        self.movieRepository = movieRepository
        self.navigationViewModel = navigationViewModel
        fetchMovieList()
    }
    
    private func fetchMovieList() {
        Task {
            do {
                movieList = try await movieRepository.getFavoriteMovies()
                print("Favourite Movie List: \(movieList)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func onRefresh() {
        fetchMovieList()
    }
    
    func onClickedMovieItem(movieId: Int) {
        print("Favourite Movie clicked: \(movieId)")
        navigationViewModel.navigateTo(screen: .movieDetails(id: movieId))
    }
    
    func onDeleteMovieItem(indexSet: IndexSet) {
        Task {
            do {
                for index in indexSet {
                    try await movieRepository.removeFavoriteMovie(movie:movieList[index])
                    print("Removed Favourite Movie with id: \(movieList[index].id)")
                }
                fetchMovieList()
            } catch {
                print("Favourite movie removal Error: \(error)")
            }
        }
    }
}
