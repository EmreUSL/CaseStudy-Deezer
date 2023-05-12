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
    
    var favoriteTracks = [Tracks]()
    
    private init() {
        self.userDefaults = UserDefaults.standard
    }
    
    func saveData() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(favoriteTracks)
            UserDefaults.standard.set(data, forKey: "favorites")
        } catch {
            print("Save Error")
        }
    }
    
    func getData() {
        guard let data = UserDefaults.standard.data(forKey: "favorites") else {return}
        do {
            let decoder = JSONDecoder()
            self.favoriteTracks = try decoder.decode([Tracks].self, from: data)
        } catch {
            print("Fetch Error")
        }
    }
}
