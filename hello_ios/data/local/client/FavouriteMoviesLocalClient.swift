//
//  FavouriteMoviesLocalClient.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

class FavouriteMoviesLocalClient: LocalClient<FavouriteMovieDbModel> {
    @MainActor
    static let shared: FavouriteMoviesLocalClient = FavouriteMoviesLocalClient()
}

