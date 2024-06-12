//
//  FavouriteMovieModel.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation

import SwiftData

@Model
class FavouriteMovieDbModel {
    var id: Int
    var title: String
    var poster: String
    var rating: Double
    var releaseYear: Int

    init(id: Int, title: String, poster: String, rating: Double, releaseYear: Int) {
        self.id = id
        self.title = title
        self.poster = poster
        self.rating = rating
        self.releaseYear = releaseYear
    }
}
