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
    private var settingsCoordinator: SettingsCoordinator?
    
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
            gameCoordinator = GameCoordinator(navigation: navigationController, dependencies: dependencies)
            gameCoordinator?.delegate = self
            gameCoordinator?.start()
        case .settings:
            settingsCoordinator = SettingsCoordinator(navigation: navigationController, settings: dependencies.settings)
            settingsCoordinator?.delegate = self
            settingsCoordinator?.start()
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
    func startSettings() {
        navigate(to: .settings)
    }
}

extension TitleCoordinator: GameCoordinatorDelegate {
    func ended() {
        gameCoordinator = nil
    }
}

extension TitleCoordinator: SettingsCoordinatorDelegate {
    func dismissed() {
        settingsCoordinator = nil
    }
}
