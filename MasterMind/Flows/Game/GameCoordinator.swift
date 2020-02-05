//
//  GameCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol GameCoordinatorDelegate: class {
    func ended()
}

class GameCoordinator: Coordinator {
    
    enum Destination {
        case nextLevel
        case end
    }
    
    private let navigationController: UINavigationController
    private let dependencies: Dependencies
    private var currentCombination: String?
    weak var delegate: GameCoordinatorDelegate?
    
    init(navigation: UINavigationController, dependencies: Dependencies){
        self.dependencies = dependencies
        self.navigationController = navigation
    }
    
    func start() {
        let viewController = GameViewController()
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .nextLevel:
            print(" moved to next level!")
        case .end:
            navigationController.popViewController(animated: false)
            delegate?.ended()
        }
    }
}

extension GameCoordinator: GameViewControllerDelegate {
    func requestDigits() -> String? {
        let total = dependencies.settings.digitLength
        let min = dependencies.settings.minValue
        let max = dependencies.settings.maxValue
        return RandomAPI.get(total: total, min: min, max: max).result()
    }
}
