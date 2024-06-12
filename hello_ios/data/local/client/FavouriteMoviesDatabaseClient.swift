//
//  FavouriteMoviesLocalClient.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

class FavouriteMoviesDatabaseClient: DatabaseClient<FavouriteMovieDatabaseModel> {
    @MainActor
    static let shared: FavouriteMoviesDatabaseClient = FavouriteMoviesDatabaseClient()
}

