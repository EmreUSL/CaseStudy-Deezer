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
    
}
