//
//  MovieViewModel.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

@Observable
class MovieViewModel {
    var movieList: [MovieListItemModel] = []
    
//    let movieRepository: MovieRepository = DummyMovieRepositoy()
    let movieRepository: MovieRepository = MovieRepositoryImpl()
    
    init() {
        Task {
            do {
                movieList = try await movieRepository.getMovieList()
                print("Movie List: \(movieList)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
