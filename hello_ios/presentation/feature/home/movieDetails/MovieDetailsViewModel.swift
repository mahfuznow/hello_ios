//
//  MovieDetailsViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

@Observable
class MovieDetailsViewModel {
    var movieDetails: MovieDetailsModel? = nil
    
    private var movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func getMovieDetails(movieId: Int) {
        Task {
            do {
                movieDetails = try await movieRepository.getMovieDetails(movieId: movieId)
                print("Movie Details: \(String(describing: movieDetails?.title))")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func onToggleFavourite () {
        guard let movieDetails = movieDetails else {
            return
        }
        Task {
            do {
                if movieDetails.isFavourite {
                    try await movieRepository.removeFavoriteMovie(
                        movie: movieDetails.toMovieListItem()
                    )
                } else {
                    try await movieRepository.addFavoriteMovie(
                        movie: movieDetails.toMovieListItem()
                    )
                }
                getMovieDetails(movieId: movieDetails.id)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
