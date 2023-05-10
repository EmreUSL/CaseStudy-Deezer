//
//  UserDefaultManager.swift
//  DeezerApp
//
//  Created by emre usul on 11.05.2023.
//

import Foundation


class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefaults: UserDefaults
    
    private init() {
        self.userDefaults = UserDefaults.standard
    }
    
    func saveData(_ data: AnyObject, forkey key: String) {
        userDefaults.set(data, forKey: key)
    }
    
    func getData(forkey key:String) -> Any? {
        return userDefaults.object(forKey: key)
    }
}
