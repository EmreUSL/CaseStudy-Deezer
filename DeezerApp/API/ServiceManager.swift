//
//  ServiceManager.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation

class ServiceManager {
    
    static let shared = ServiceManager()

    func getData(url: String, completion: @escaping (Result<[CellModel], ErrorTypes>) -> Void) {
     
        NetworkManager.shared.request(type: ResponseModel.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
                
            case .success(let category):
                completion(.success(category.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
    func getArtist(url: String, completion: @escaping (Result<ArtistModel, ErrorTypes>) -> Void) {
        NetworkManager.shared.request(type: ArtistModel.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
                
            case .success(let category):
                completion(.success(category))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAlbum(url: String, completion: @escaping (Result<[Datum], ErrorTypes>) -> Void) {
        NetworkManager.shared.request(type: ArtistResponse.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
                
            case .success(let category):
                completion(.success(category.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func getTrack(url: String, completion: @escaping (Result<[Tracks], ErrorTypes>) -> Void) {
        NetworkManager.shared.request(type: AlbumResponse.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
                
            case .success(let category):
                completion(.success(category.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
