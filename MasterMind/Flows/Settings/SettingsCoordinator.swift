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
    
    enum Destination {
        case back
    }
    
    private let navigationController: UINavigationController
    private let settings: Settings
    
    weak var delegate: SettingsCoordinatorDelegate?
    
    init(navigation: UINavigationController, settings: Settings) {
        self.navigationController = navigation
        self.settings = settings
    }
    
    func start() {
        let viewController = SettingsViewController(settings: settings)
        viewController.delegate = self
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .back:
            self.delegate?.dismissed()
        }
    }
}

extension SettingsCoordinator: SettingsViewControllerDelegate {
    func updateValues(digits: Int, min: Int, max: Int) {
        if digits >= 4 && digits <= 8 && min >= 0 && min <= 9 && max >= 0 && max <= 9 && max >= min {
            settings.setValues(length: digits, min: min, max: max)
        }
    }
    
    func dismissed() {
        self.navigate(to: .back)
    }
}
