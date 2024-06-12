//
//  MovieSearchViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import Foundation

@Observable
class MovieSearchViewModel {
    
    var movieList: [MovieListItemModel] = []
    
    private var movieRepository: MovieRepository
    private var navigationViewModel: NavigationViewModel
    
    init(movieRepository: MovieRepository, navigationViewModel: NavigationViewModel) {
        self.movieRepository = movieRepository
        self.navigationViewModel = navigationViewModel
        fetchMovieListUsingQuery()
    }
    
    var searchQuery: String = "" {
        didSet {
            print("Search query changed: \(searchQuery)")
            debouncedSearch()
        }
    }
    
    func onSearchSubmit() {
        print("Search query submitted: \(searchQuery)")
    }
    
    private func debouncedSearch() {
        Debouncer.shared.debounce {
            self.fetchMovieListUsingQuery()
        }
    }
    
    private func fetchMovieListUsingQuery() {
        print("Fetching movie list using query: \(searchQuery)")
        Task {
            do {
                movieList = try await movieRepository.getMovieListByQuery(query: searchQuery)
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
