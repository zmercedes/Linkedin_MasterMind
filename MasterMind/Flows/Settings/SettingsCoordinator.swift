//
//  SettingsCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    enum Destination { }
    
    private let navigationController: UINavigationController
    private let settings: Settings
    
    init(navigation: UINavigationController, settings: Settings) {
        self.navigationController = navigation
        self.settings = settings
    }
    
    func start() {
        
    }
    
    func navigate(to destination: Destination) {
        
    }
}
