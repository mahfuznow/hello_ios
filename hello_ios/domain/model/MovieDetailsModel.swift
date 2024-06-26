//
//  MovieDetailsModel.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

struct MovieDetailsModel {
    let id: Int
    let title: String
    let description: String
    let largeCoverImage: String
    let releaseYear: Int
    let rating: Double
    let duration: Int
    let genres: [MovieGenre]
    var isFavourite: Bool = false
    
    
    static func fromMovie(movie: MovieDetailsResponse.Movie, isFavourite: Bool = false) -> MovieDetailsModel {
        return MovieDetailsModel(
            id: movie.id,
            title: movie.title,
            description: movie.descriptionFull,
            largeCoverImage: movie.largeCoverImage,
            releaseYear: movie.year,
            rating: movie.rating,
            duration: movie.runtime,
            genres: movie.genres.map({ MovieGenre.fromString($0) }),
            isFavourite: isFavourite
        )
    }
    
    func toMovieListItem() -> MovieListItemModel {
        return MovieListItemModel(
            id: id,
            title: title,
            poster: largeCoverImage,
            rating: rating,
            releaseYear: releaseYear,
            isFavourite: isFavourite
        )
    }
}
