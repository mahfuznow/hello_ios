//
//  BaseResponse.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import Foundation

// MARK: - BaseResponse
struct BaseResponse<T: Codable>: Codable {
    let status: Stat
    let statusMessage: String
    let data: T
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case data
        case meta = "@meta"
    }
    
    enum Stat: String, Codable {
        case ok = "ok"
    }
    
    // MARK: - Meta
    struct Meta: Codable {
        let serverTime: Int
        let serverTimezone: String
        let apiVersion: Int
        let executionTime: String

        enum CodingKeys: String, CodingKey {
            case serverTime = "server_time"
            case serverTimezone = "server_timezone"
            case apiVersion = "api_version"
            case executionTime = "execution_time"
        }
    }
}

