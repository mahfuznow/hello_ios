//
//  LocalServiceImpl.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

class DatabaseServiceImpl: DatabaseService {
    
    var favouriteMoviesLocalClient: FavouriteMoviesDatabaseClient
    
    @MainActor
    init(favouriteMoviesLocalClient: FavouriteMoviesDatabaseClient = FavouriteMoviesDatabaseClient.shared) {
        self.favouriteMoviesLocalClient = favouriteMoviesLocalClient
    }
    
    func getFavouriteMovieList() async throws -> [FavouriteMovieDbModel] {
        return favouriteMoviesLocalClient.fetchItems()
    }
    
    func addFavouriteMovie(movie: FavouriteMovieDbModel) async throws {
        let movies = try await getFavouriteMovieList()
        if(movies.contains{ $0.id == movie.id }) {
            print("Movie already exists in favourite list")
            return
        }
        favouriteMoviesLocalClient.appendItem(item: movie)
    }
    
    func removeFavouriteMovie(movieId: Int) async throws {
        let movies = try await getFavouriteMovieList()
        movies.filter{ $0.id == movieId }.forEach{
            favouriteMoviesLocalClient.removeItem($0)
        }
    }
    
}
