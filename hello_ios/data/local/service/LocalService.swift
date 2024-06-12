//
//  LocalService.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

protocol LocalService {
    func getFavouriteMovieList() async throws -> [FavouriteMovieDbModel]
    func addFavouriteMovie(movie: FavouriteMovieDbModel) async throws
    func removeFavouriteMovie(movie: FavouriteMovieDbModel) async throws
}
