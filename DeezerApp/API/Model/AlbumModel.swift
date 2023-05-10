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

struct Tracks: Codable {
    let title: String?
    let duration: Int?
    let md5_image: String?
    let preview: String?
}



