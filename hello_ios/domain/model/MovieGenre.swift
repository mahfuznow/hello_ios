//
//  MovieGenre.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//

import Foundation

enum MovieGenre {
    case action, adventure, comedy, drama, horror, scifi
    
    static func fromString(_ genre: String) -> MovieGenre {
        switch genre {
        case "action":
            return .action
        case "adventure":
            return .adventure
        case "comedy":
            return .comedy
        case "drama":
            return .drama
        case "horror":
            return .horror
        case "scifi":
            return .scifi
        default:
            return .action
        }
    }
    
    func toString() -> String {
        switch self {
        case .action:
            return "action"
        case .adventure:
            return "adventure"
        case .comedy:
            return "comedy"
        case .drama:
            return "drama"
        case .horror:
            return "horror"
        case .scifi:
            return "scifi"
        }
    }
}
