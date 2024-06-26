//
//  MovieListItem.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

struct MovieListItemModel: Identifiable {
    var id: Int
    var title: String
    var poster: String
    var rating: Double
    var releaseYear: Int
    var isFavourite: Bool
    
    init(
        id: Int,
        title: String,
        poster: String,
        rating: Double,
        releaseYear: Int,
        isFavourite: Bool = false
    ) {
        self.id = id
        self.title = title
        self.poster = poster
        self.rating = rating
        self.releaseYear = releaseYear
        self.isFavourite = isFavourite
    }
    
    static func fromMovie(movie: MovieListResponse.Movie, isFavourite: Bool = false) -> MovieListItemModel {
        return MovieListItemModel(
            id: movie.id,
            title: movie.title,
            poster: movie.mediumCoverImage,
            rating: movie.rating,
            releaseYear: movie.year,
            isFavourite: isFavourite
        )
    }
    
    static func fromFavouriteMovie(favouriteMovie: FavouriteMovieDatabaseModel) -> MovieListItemModel {
        return MovieListItemModel(
            id: favouriteMovie.id,
            title: favouriteMovie.title,
            poster: favouriteMovie.poster,
            rating: favouriteMovie.rating,
            releaseYear: favouriteMovie.releaseYear
        )
    }
    
    func toFavouriteMovie() -> FavouriteMovieDatabaseModel {
        return FavouriteMovieDatabaseModel(
            id: id,
            title: title,
            poster: poster,
            rating: rating,
            releaseYear: releaseYear
        )
    }
    
}
