//
//  ApiService.swift
//  hello_ios
//
//  Created by BS1002 on 11/6/24.
//

import Foundation

protocol ApiService {
    func getMovieList() async throws -> [MovieListItemModel]
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel]
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel]
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsModel
}
