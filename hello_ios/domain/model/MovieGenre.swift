//
//  MovieGenre.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

enum MovieGenre {
    case action, adventure, comedy, drama, horror, scifi, unknown
    
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
        case .unknown:
            return "Unknown"
        }
    }
}
