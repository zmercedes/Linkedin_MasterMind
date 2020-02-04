//
//  TitleCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/3/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class TitleCoordinator: Coordinator {
    
    enum Destination {
        case game
        case settings
    }
    
    private let navigationController: UINavigationController
    private let dependencies: Dependencies
    private var gameCoordinator: GameCoordinator?
    
    init(navigation: UINavigationController, dependencies: Dependencies) {
        self.navigationController = navigation
        self.dependencies = dependencies
    }
    
    func start() {
        let viewController = TitleViewController()
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .game:
            gameCoordinator = GameCoordinator(dependencies: dependencies)
            gameCoordinator?.start()
        case .settings:
            print("travelled to settings")
        }
    }
    
    @objc func settingsButtonPressed() {
        navigate(to: .settings)
    }
}

extension TitleCoordinator: TitleViewControllerDelegate {
    func startGame() {
        navigate(to: .game)
    }
}
