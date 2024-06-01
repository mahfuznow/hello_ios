//
//  MovieViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

@Observable
class MovieListViewModel: ObservableObject {
    var movieList: [MovieListItemModel] = []
    var isMovieDetailsPresented: Bool = false
    var selectedMovieId: Int = 0
    

    private var movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
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
        selectedMovieId = movieId
        isMovieDetailsPresented = true
    }
}