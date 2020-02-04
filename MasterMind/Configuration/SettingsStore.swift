//
//  SettingsStore.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class SettingsStore {
    
    enum Key: String {
        case digitLength
        case min
        case max
        func make() -> String {
            return self.rawValue
        }
    }
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        if getLength() == nil || getMin() == nil || getMax() == nil {
            saveValue(forKey: .digitLength, value: 4)
            saveValue(forKey: .min, value: 0)
            saveValue(forKey: .max, value: 7)
        }
    }
    
    func getLength() -> Int? {
        return readValue(forKey: .digitLength)
    }
    
    func getMin() -> Int? {
        return readValue(forKey: .min)
    }
    
    func getMax() -> Int? {
        return readValue(forKey: .max)
    }
    
    private func saveValue(forKey key: Key, value: Int) {
        userDefaults.set(value, forKey: key.make())
    }
    
    private func readValue(forKey key: Key) -> Int? {
        return userDefaults.integer(forKey: key.make())
    }
}
