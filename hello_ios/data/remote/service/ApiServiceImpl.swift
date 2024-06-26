//
//  ApiServiceImpl.swift
//  hello_ios
//
//  Created by BS1002 on 11/6/24.
//

import Foundation

class ApiServiceImpl : ApiService {
    
    private let apiClient: ApiClient
    private var baseURL = URL(string: "https://yts.mx/api/v2")!
    
    init(apiClient: ApiClient, baseURL: URL? = nil) {
        self.apiClient = apiClient
        if let baseURL = baseURL {
            self.baseURL = baseURL
        }
    }
    
    func getMovieList() async throws -> BaseResponse<MovieListResponse> {
        let url = baseURL.appendingPathComponent("/list_movies.json")
        let response: BaseResponse<MovieListResponse> = try await apiClient.get(url: url)
        return response
    }
    
    func getMovieListByQuery(query: String) async throws -> BaseResponse<MovieListResponse> {
        var components = URLComponents(url: baseURL.appendingPathComponent("/list_movies.json"), resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "query_term", value: query)]
        let url = components.url!
        let response: BaseResponse<MovieListResponse> = try await apiClient.get(url: url)
        return response
    }
    
    func getMovieListByGenre(genre: MovieGenre) async throws -> BaseResponse<MovieListResponse> {
        var components = URLComponents(url: baseURL.appendingPathComponent("/list_movies.json"), resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "genre", value: genre.toString())]
        let url = components.url!
        let response: BaseResponse<MovieListResponse> = try await apiClient.get(url: url)
        return response
    }
    
    func getMovieDetails(movieId: Int) async throws -> BaseResponse<MovieDetailsResponse> {
        var components = URLComponents(url: baseURL.appendingPathComponent("/movie_details.json"), resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "movie_id", value: "\(movieId)")]
        let url = components.url!
        let response: BaseResponse<MovieDetailsResponse> = try await apiClient.get(url: url)
        return response
    }
}

