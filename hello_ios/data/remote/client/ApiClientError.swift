//
//  ApiClientError.swift
//  hello_ios
//
//  Created by BS1002 on 2/6/24.
//

import Foundation

enum ApiClientError: Error {
    case networkError(Error)
    case encodingError(Error)
    case decodingError(Error)
    case noData
}
