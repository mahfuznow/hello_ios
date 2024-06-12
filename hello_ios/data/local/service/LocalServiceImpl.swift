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
        favouriteMoviesLocalClient.appendItem(item: movie)
    }
    
    func removeFavouriteMovie(movie: FavouriteMovieDbModel) async throws {
        favouriteMoviesLocalClient.removeItem(movie)
    }
    
}
