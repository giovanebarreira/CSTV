//
//  NetworkError.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidURL(String)
    case serverError
    case decodingError
    case badResponse
    case invalidPage

    var errorDescription: String? {
        switch self {
        case .invalidURL(let url): return "\(url) is unreachable"
        case .serverError: return "A server error ocurred"
        case .decodingError: return "Error ocurred when decoding Json response"
        case .badResponse: return "Error, bad response"
        case .invalidPage: return "Invalid requested page"
        }
    }
}
