//
//  ApiService.swift
//  hello_ios
//
//  Created by BS1002 on 11/6/24.
//

import Foundation

protocol ApiService {
    func getMovieList() async throws -> BaseResponse<MovieListResponse>
    func getMovieListByQuery(query: String) async throws -> BaseResponse<MovieListResponse>
    func getMovieListByGenre(genre: MovieGenre) async throws -> BaseResponse<MovieListResponse>
    func getMovieDetails(movieId: Int) async throws -> BaseResponse<MovieDetailsResponse>
}
