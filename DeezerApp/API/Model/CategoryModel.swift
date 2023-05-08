//
//  CategoryModel.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation

struct ResponseModel: Codable {
    let data: [CellModel]
}

struct CellModel: Codable {
    let id: Int?
    let name: String?
    let picture: String?
}




