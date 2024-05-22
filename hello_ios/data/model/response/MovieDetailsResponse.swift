//
//  MovieDetailsResponse.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//
// To parse the JSON, add this file to your project and do:
//
//   let movieDetailsResponse = try? JSONDecoder().decode(MovieDetailsResponse.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct MovieDetailsResponse: Codable {
    let movie: Movie
    
    // MARK: - MovieDetials
    struct Movie: Codable {
        let id: Int
        let url: String
        let imdbCode, title, titleEnglish, titleLong: String
        let slug: String
        let year, rating, runtime: Int
        let genres: [String]
        let likeCount: Int
        let descriptionIntro, descriptionFull, ytTrailerCode, language: String
        let mpaRating: String
        let backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String
        let largeCoverImage: String
        let torrents: [Torrent]
        let dateUploaded: String
        let dateUploadedUnix: Int
        
        enum CodingKeys: String, CodingKey {
            case id, url
            case imdbCode = "imdb_code"
            case title
            case titleEnglish = "title_english"
            case titleLong = "title_long"
            case slug, year, rating, runtime, genres
            case likeCount = "like_count"
            case descriptionIntro = "description_intro"
            case descriptionFull = "description_full"
            case ytTrailerCode = "yt_trailer_code"
            case language
            case mpaRating = "mpa_rating"
            case backgroundImage = "background_image"
            case backgroundImageOriginal = "background_image_original"
            case smallCoverImage = "small_cover_image"
            case mediumCoverImage = "medium_cover_image"
            case largeCoverImage = "large_cover_image"
            case torrents
            case dateUploaded = "date_uploaded"
            case dateUploadedUnix = "date_uploaded_unix"
        }
        
        // MARK: - Torrent
        struct Torrent: Codable {
            let url: String
            let hash, quality, type, isRepack: String
            let videoCodec, bitDepth, audioChannels: String
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
        }
    }
}
