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
    
    var movieRepository: MovieRepository
    
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
}
