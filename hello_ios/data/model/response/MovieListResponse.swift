//
//  MovieListResponse.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//
// To parse the JSON, add this file to your project and do:
//
//   let movieListResponse = try? JSONDecoder().decode(MovieListResponse.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct MovieListResponse: Codable {
    let movieCount, limit, pageNumber: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movies
    }
    
    // MARK: - Movie
    struct Movie: Codable {
        let id: Int
        let url: String
        let imdbCode, title, titleEnglish, titleLong: String
        let slug: String
        let year: Int
        let rating: Double
        let runtime: Int
        let genres: [String]
        let summary, descriptionFull, synopsis, ytTrailerCode: String
        let language: String
        let mpaRating: MpaRating
        let backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String
        let largeCoverImage: String
        let state: Stat
        let torrents: [Torrent]
        let dateUploaded: String
        let dateUploadedUnix: Int
        
        enum CodingKeys: String, CodingKey {
            case id, url
            case imdbCode = "imdb_code"
            case title
            case titleEnglish = "title_english"
            case titleLong = "title_long"
            case slug, year, rating, runtime, genres, summary
            case descriptionFull = "description_full"
            case synopsis
            case ytTrailerCode = "yt_trailer_code"
            case language
            case mpaRating = "mpa_rating"
            case backgroundImage = "background_image"
            case backgroundImageOriginal = "background_image_original"
            case smallCoverImage = "small_cover_image"
            case mediumCoverImage = "medium_cover_image"
            case largeCoverImage = "large_cover_image"
            case state, torrents
            case dateUploaded = "date_uploaded"
            case dateUploadedUnix = "date_uploaded_unix"
        }
        
        enum MpaRating: String, Codable {
            case empty = ""
            case pg = "PG"
        }
        
        enum Stat: String, Codable {
            case ok = "ok"
        }
        
        
        // MARK: - Torrent
        struct Torrent: Codable {
            let url: String
            let hash: String
            let quality: Quality
            let type: TypeEnum
            let isRepack: String
            let videoCodec: VideoCodec
            let bitDepth, audioChannels: String
            let seeds, peers: Int
            let size: String
            let sizeBytes: Int
            let dateUploaded: String
            let dateUploadedUnix: Int
            
            enum CodingKeys: String, CodingKey {
                case url, hash, quality, type
                case isRepack = "is_repack"
                case videoCodec = "video_codec"
                case bitDepth = "bit_depth"
                case audioChannels = "audio_channels"
                case seeds, peers, size
                case sizeBytes = "size_bytes"
                case dateUploaded = "date_uploaded"
                case dateUploadedUnix = "date_uploaded_unix"
            }
            
            enum Quality: String, Codable {
                case the1080P = "1080p"
                case the720P = "720p"
            }
            
            enum TypeEnum: String, Codable {
                case bluray = "bluray"
                case web = "web"
            }
            
            enum VideoCodec: String, Codable {
                case x264 = "x264"
            }
            
        }
    }
}
