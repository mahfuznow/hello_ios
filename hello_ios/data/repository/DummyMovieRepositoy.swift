//
//  MovieRepositoy.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import Foundation

class DummyMovieRepositoy: MovieRepository {
    func getMovieList() -> [MovieListItemModel] {
        return [
            MovieListItemModel(id: 0, title: "Movie 1", poster: "poster1", rating: 7.5, releaseYear: 2020),
            MovieListItemModel(id: 1, title: "Movie 2", poster: "poster2", rating: 8.5, releaseYear: 2021),
            MovieListItemModel(id: 2, title: "Movie 3", poster: "poster3", rating: 6.5, releaseYear: 2019),
            MovieListItemModel(id: 3, title: "Movie 4", poster: "poster4", rating: 9.5, releaseYear: 2018),
            MovieListItemModel(id: 4, title: "Movie 5", poster: "poster5", rating: 5.5, releaseYear: 2017),
        ]
    }
    
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel] {
        return [
            MovieListItemModel(id: 0, title: "Movie 1", poster: "poster1", rating: 7.5, releaseYear: 2020),
            MovieListItemModel(id: 1, title: "Movie 2", poster: "poster2", rating: 8.5, releaseYear: 2021),
            MovieListItemModel(id: 2, title: "Movie 3", poster: "poster3", rating: 6.5, releaseYear: 2019),
            MovieListItemModel(id: 3, title: "Movie 4", poster: "poster4", rating: 9.5, releaseYear: 2018),
            MovieListItemModel(id: 4, title: "Movie 5", poster: "poster5", rating: 5.5, releaseYear: 2017),
        ]
    }
    
    func getMovieListByGenre(genre: MovieGenre) -> [MovieListItemModel] {
        return [
            MovieListItemModel(id: 0, title: "Movie 1", poster: "poster1", rating: 7.5, releaseYear: 2020),
            MovieListItemModel(id: 1, title: "Movie 2", poster: "poster2", rating: 8.5, releaseYear: 2021),
            MovieListItemModel(id: 2, title: "Movie 3", poster: "poster3", rating: 6.5, releaseYear: 2019),
        ]
        
    }
    
    func getMovieDetails(movieId: Int) -> MovieDetailsModel {
        return MovieDetailsModel(
            title: "Movie 1",
            description: "This is a movie",
            largeCoverImage: "largeCoverImage",
            releaseYear: 2020,
            rating: 7,
            duration: 120,
            genres: [.action, .comedy]
        )
    }
    
    var favouriteMovies: [FavouriteMovieDbModel] = []
    
    func getFavoriteMovies() async throws -> [MovieListItemModel] {
        return favouriteMovies.map{MovieListItemModel.fromFavouriteMovie(favouriteMovie: $0)}
    }
    
    func addFavoriteMovie(movie: MovieListItemModel) async throws {
        favouriteMovies.append(movie.toFavouriteMovie())
    }
    
    func removeFavoriteMovie(movie: MovieListItemModel) async throws {
        favouriteMovies.removeAll(where: {$0.id == movie.id})
    }
}
