//
//  MovieRepositoryImpl.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private let apiService: ApiService
    private let databaseService: DatabaseService
    
    init(apiService: ApiService, databaseService: DatabaseService) {
        self.apiService = apiService
        self.databaseService = databaseService
    }
    
    func getMovieList() async throws -> [MovieListItemModel] {
        let response: BaseResponse<MovieListResponse> = try await apiService.getMovieList()
        let favouriteMovieIds = try await getFavouriteMovieIds()
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(
                movie: movie,
                isFavourite: favouriteMovieIds.contains(movie.id)
            )
        }
    }
    
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel] {
        let response = try await apiService.getMovieListByQuery(query: query)
        
        let favouriteMovieIds = try await getFavouriteMovieIds()
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(
                movie: movie,
                isFavourite: favouriteMovieIds.contains(movie.id)
            )
        }
    }
    
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel] {
        let response = try await apiService.getMovieListByGenre(genre: genre)
        
        let favouriteMovieIds = try await getFavouriteMovieIds()
        return response.data.movies.map{ movie in
            MovieListItemModel.fromMovie(
                movie: movie,
                isFavourite: favouriteMovieIds.contains(movie.id)
            )
        }
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsModel {
        let response = try await apiService.getMovieDetails(movieId: movieId)
        
        let favouriteMovieIds = try await getFavouriteMovieIds()
        return MovieDetailsModel.fromMovie(
            movie: response.data.movie,
            isFavourite: favouriteMovieIds.contains(response.data.movie.id)
        )
    }
    
    func getFavoriteMovies() async throws -> [MovieListItemModel] {
        let favouriteMovieList: [FavouriteMovieDatabaseModel] = try await databaseService.getFavouriteMovieList()
        return favouriteMovieList.map{MovieListItemModel.fromFavouriteMovie(favouriteMovie: $0)}
    }
    
    func addFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await databaseService.addFavouriteMovie(movie: movie.toFavouriteMovie())
    }
    
    func removeFavoriteMovie(movie: MovieListItemModel) async throws -> Void {
        try await databaseService.removeFavouriteMovie(movieId: movie.id)
    }
    
    private func getFavouriteMovieIds() async throws -> [Int] {
        let favouriteMovieList: [FavouriteMovieDatabaseModel] = try await databaseService.getFavouriteMovieList()
        return favouriteMovieList.map{$0.id}
    }
}
