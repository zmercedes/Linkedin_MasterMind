//
//  Settings.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

final class Settings {
    
    var digitLength: Int = 4 {
        didSet {
            if oldValue != digitLength {
                settingsStore.storeValue(value: digitLength, key: .digitLength)
            }
        }
    }
    var minValue: Int = 0 {
        didSet {
            if oldValue != minValue {
                settingsStore.storeValue(value: minValue, key: .min)
            }
        }
    }
    var maxValue: Int = 7 {
        didSet {
            if oldValue != maxValue {
                settingsStore.storeValue(value: maxValue, key: .max)
            }
        }
    }
    private let settingsStore: SettingsStore
    
    init(store: SettingsStore){
        self.settingsStore = store
        if let digits = settingsStore.getLength(), digitLength != digits {
            self.digitLength = digits
        }
        if let min = settingsStore.getMin(), minValue != min {
            self.minValue = min
        }
        if let max = settingsStore.getMax(), maxValue != max {
            self.maxValue = max
        }
    }
    
    func setValues(length: Int, min: Int, max: Int) {
        digitLength = length
        minValue = min
        maxValue = max
    }
}
