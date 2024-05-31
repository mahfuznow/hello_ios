//
//  MovieRepositoryImpl.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    func getMovieList() async throws -> [MovieListItemModel] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(BaseResponse<MovieListResponse>.self, from: data)
        
        return response.data.movies.map { movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieListByQuery(query: String) async throws -> [MovieListItemModel] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json?query_term=\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(BaseResponse<MovieListResponse>.self, from: data)
        
        return response.data.movies.map { movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieListByGenre(genre: MovieGenre) async throws -> [MovieListItemModel] {
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json?genre=\(genre.toString())")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(BaseResponse<MovieListResponse>.self, from: data)
        
        return response.data.movies.map { movie in
            MovieListItemModel.fromMovie(movie: movie)
        }
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsModel {
        let url = URL(string: "https://yts.mx/api/v2/movie_details.json?movie_id=\(movieId)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(BaseResponse<MovieDetailsResponse>.self, from: data)
        
        return MovieDetailsModel.fromMovie(movie: response.data.movie)
    }
    
}
