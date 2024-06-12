//
//  LocalServiceImpl.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

class LocalServiceImpl: LocalService {
    
    var favouriteMoviesLocalClient: FavouriteMoviesLocalClient
    
    @MainActor
    init(favouriteMoviesLocalClient: FavouriteMoviesLocalClient = FavouriteMoviesLocalClient.shared) {
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
