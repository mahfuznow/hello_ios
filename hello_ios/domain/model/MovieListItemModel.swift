//
//  MovieListItem.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

class MovieListItemModel: Identifiable {
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
    
    static func fromMovie(movie: MovieListResponse.Movie) -> MovieListItemModel {
        return MovieListItemModel(id: movie.id, title: movie.title, poster: movie.mediumCoverImage, rating: movie.rating, releaseYear: movie.year)
    }
    
}
