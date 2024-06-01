//
//  MovieViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

@Observable
class MovieListViewModel {
    var movieList: [MovieListItemModel] = []

    private var movieRepository: MovieRepository
    private var navigationViewModel: NavigationViewModel
    
    init(movieRepository: MovieRepository, navigationViewModel: NavigationViewModel) {
        self.movieRepository = movieRepository
        self.navigationViewModel = navigationViewModel
        fetchMovieList()
    }
    
    private func fetchMovieList() {
        Task {
            do {
                movieList = try await movieRepository.getMovieList()
                print("Movie List: \(movieList)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func onClickedMovieItem(movieId: Int) {
        print("Movie clicked: \(movieId)")
        navigationViewModel.navigateTo(screen: .movieDetails(id: movieId))
    }
}
