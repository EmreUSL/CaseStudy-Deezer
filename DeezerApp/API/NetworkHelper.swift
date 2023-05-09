//
//  NetworkHelper.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String,Error {
    case invalidData = "InvalidData"
    case invalidURL = "Invalid URL"
    case jsonDecodeError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://api.deezer.com/genre"
    
    func getGenreURL(id: Int) -> String {
        return "https://api.deezer.com/genre/\(id)/artists"
    }
    
    func getArtistURL(id: Int) -> String {
        return "https://api.deezer.com/artist/\(id)"
    }
}
