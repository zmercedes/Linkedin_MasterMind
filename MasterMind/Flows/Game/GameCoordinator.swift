//
//  GameCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class GameCoordinator: Coordinator {
    
    enum Destination {
        case nextLevel
    }
    
    private let dependencies: Dependencies
    private var currentCombination: [Int]?
    
    init(dependencies: Dependencies){
        self.dependencies = dependencies
    }
    
    func start() {
        let total = dependencies.settings.digitLength
        let min = dependencies.settings.minValue
        let max = dependencies.settings.maxValue
        if let newDigits = RandomAPI.get(total: total, min: min, max: max).result() {
            currentCombination = newDigits
        }
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .nextLevel :
            print(" moved to next level!")
        }
    }
}
