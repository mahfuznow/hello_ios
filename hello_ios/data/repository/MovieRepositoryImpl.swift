//
//  MovieRepositoryImpl.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getMovieList() async throws -> [MovieListItemModel] {
        return try await apiService.getMovieList()
    }
    
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel] {
        return try await apiService.getMovieListByQuery(query: query)
    }
    
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel] {
        return try await apiService.getMovieListByGenre(genre: genre)
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsModel {
        return try await apiService.getMovieDetails(movieId: movieId)
    }
    
}
