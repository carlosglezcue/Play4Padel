//
//  UserDefaultsManager.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 6/12/24.
//

import Foundation

actor UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    
    func get<T>(forKey key: String) async -> T? {
        return userDefaults.object(forKey: key) as? T
    }
    
    func set<T>(_ value: T, forKey key: String) async {
        await Task {
            userDefaults.set(value, forKey: key)
        }.value
    }
    
    func remove(forKey key: String) async {
        await Task {
            userDefaults.removeObject(forKey: key)
        }.value
    }
}
