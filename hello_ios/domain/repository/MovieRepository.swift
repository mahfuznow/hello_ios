//
//  MovieRepository.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

protocol MovieRepository {
    func getMovieList() async throws -> [MovieListItemModel]
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel]
    func getMovieDetails(movieId: Int) async throws-> MovieDetailsModel
}
