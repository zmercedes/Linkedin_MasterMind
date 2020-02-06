//
//  SettingsCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol SettingsCoordinatorDelegate: class {
    func dismissed()
}

class SettingsCoordinator: Coordinator {
    
    enum Destination { }
    
    private let navigationController: UINavigationController
    private let settings: Settings
    
    weak var delegate: SettingsCoordinatorDelegate?
    
    init(navigation: UINavigationController, settings: Settings) {
        self.navigationController = navigation
        self.settings = settings
    }
    
    func start() {
        let viewController = SettingsViewController(settings: settings)
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func navigate(to destination: Destination) { }
}

extension SettingsCoordinator: SettingsViewControllerDelegate {
    func updateValues() {
        
    }
    
    func dismissed() {
        self.delegate?.dismissed()
    }
}
