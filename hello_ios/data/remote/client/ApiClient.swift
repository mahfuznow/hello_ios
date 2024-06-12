//
//  ApiClient.swift
//  hello_ios
//
//  Created by BS1002 on 2/6/24.
//

import Foundation

protocol ApiClient {
    func get<T: Decodable>(url: URL) async throws -> T
    func post<T: Decodable, U: Encodable>(url: URL, body: U) async throws -> T
    func put<T: Decodable, U: Encodable>(url: URL, body: U) async throws -> T
    func delete<T: Decodable>(url: URL) async throws -> T
}
