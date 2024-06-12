//
//  LocalService.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

protocol DatabaseService {
    func getFavouriteMovieList() async throws -> [FavouriteMovieDatabaseModel]
    func addFavouriteMovie(movie: FavouriteMovieDatabaseModel) async throws
    func removeFavouriteMovie(movieId: Int) async throws
}
