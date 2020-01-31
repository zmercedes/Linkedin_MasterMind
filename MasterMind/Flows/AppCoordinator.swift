//
//  AppCoordinator.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 1/31/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

import UIKit

class AppCoordinator: Coordinator {
    
    enum Destination {
        case game
        case settings
    }
    
    func start() {
        
    }
    
    func navigate(to destination: AppCoordinator.Destination) {
        switch destination {
        case .game:
            print("travelled to game")
        case .settings:
            print("travelled to settings")
        }
    }
}
