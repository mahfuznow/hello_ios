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
        let response: BaseResponse<MovieListResponse> = try await apiService.getMovieList()
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel] {
        let response = try await apiService.getMovieListByQuery(query: query)
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel] {
        let response = try await apiService.getMovieListByGenre(genre: genre)
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsModel {
        let response = try await apiService.getMovieDetails(movieId: movieId)
        return MovieDetailsModel.fromMovie(movie: response.data.movie)
    }
    
    func getFavoriteMovies() async throws -> [MovieListItemModel] {
        let favouriteMovieList: [FavouriteMovieDbModel] = try await localService.getFavouriteMovieList()
        return favouriteMovieList.map{MovieListItemModel.fromFavouriteMovie(favouriteMovie: $0)}
    }
    
    func addFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await localService.addFavouriteMovie(movie: movie.toFavouriteMovie())
    }
    
    func removeFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await localService.removeFavouriteMovie(movieId: movie.id)
    }
    
}
