//
//  NetworkManager.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T:Codable>(type:T.Type,
                            url:String,
                            method:HTTPMethods,
                            completion: @escaping((Result<T, ErrorTypes>)->())) {
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch  {
                    print(ErrorTypes.jsonDecodeError)
                }
            case .failure(_):
                completion(.failure(.invalidData))
            }
        }
    }
}
