//
//  AlbumModel.swift
//  DeezerApp
//
//  Created by emre usul on 10.05.2023.
//

import Foundation

struct AlbumResponse: Codable {
    let data: [Tracks]
}

struct Tracks: Codable, Equatable {
    let id: Int?
    let title: String?
    let duration: Int?
    let preview: String?
    
    static func == (lhs: Tracks, rhs: Tracks) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }
}



