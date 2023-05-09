//
//  ArtistDetailModel.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import Foundation

struct ArtistModel: Codable {
    let name: String?
    let picture: String?
    let tracklist: String?
}

struct ArtistResponse: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let title: String?
    let preview: String?
    let contributor: [Artist]?
    let album: Album?
}

struct Album: Codable {
    let title: String?
    let cover: String?
}

struct Artist: Codable {
    let name: String?
    let picture: String?
}
