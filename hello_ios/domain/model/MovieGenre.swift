//
//  MovieGenre.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

enum MovieGenre {
    case action, adventure, comedy, drama, horror, scifi, animation, crime, fantasy, mystery, romance, thriller, western, unknown;
    
    static func fromString(_ genre: String) -> MovieGenre {
        switch genre {
        case "Action":
            return .action
        case "Adventure":
            return .adventure
        case "Comedy":
            return .comedy
        case "Drama":
            return .drama
        case "Horror":
            return .horror
        case "Sci-Fi":
            return .scifi
        case "Animation":
            return .animation
        case "Crime":
            return .crime
        case "Fantasy":
            return .fantasy
        case "Mystery":
            return .mystery
        case "Romance":
            return .romance
        case "Thriller":
            return .thriller
        case "Western":
            return .western
        default:
            return .unknown
        }
    }
    
    func toString() -> String {
        switch self {
        case .action:
            return "Action"
        case .adventure:
            return "Adventure"
        case .comedy:
            return "Comedy"
        case .drama:
            return "Drama"
        case .horror:
            return "Horror"
        case .scifi:
            return "Sci-Fi"
        case .animation:
            return "Animation"
        case .crime:
            return "Crime"
        case .fantasy:
            return "Fantasy"
        case .mystery:
            return "Mystery"
        case .romance:
            return "Romance"
        case .thriller:
            return "Thriller"
        case .western:
            return "Western"
        default:
            return "Unknown"
        }
    }
}
