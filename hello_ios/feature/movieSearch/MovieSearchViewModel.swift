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
    var isMovieDetailsPresented: Bool = false
    var selectedMovieId: Int = 0
    

    private var movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    var searchQuery: String = "" {
        didSet {
            print("Search query changed: \(searchQuery)")
            fetchMovieListUsingQuery()
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
    
}
