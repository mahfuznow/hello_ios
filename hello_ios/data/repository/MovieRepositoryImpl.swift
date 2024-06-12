//
//  MovieRepositoryImpl.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private let apiService: ApiService
    private let localService: LocalService
    
    init(apiService: ApiService, localService: LocalService) {
        self.apiService = apiService
        self.localService = localService
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
    
    func getFavoriteMovies() async throws -> [MovieListItemModel] {
        let favouriteMovieList: [FavouriteMovieDbModel] = try await localService.getFavouriteMovieList()
        return favouriteMovieList.map{MovieListItemModel.fromFavouriteMovie(favouriteMovie: $0)}
    }
    
    func addFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await localService.addFavouriteMovie(movie: movie.toFavouriteMovie())
    }
    
    func removeFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await localService.removeFavouriteMovie(movie: movie.toFavouriteMovie())
    }
    
}
