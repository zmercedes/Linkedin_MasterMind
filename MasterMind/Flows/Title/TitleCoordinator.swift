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
    
    func start() {
        
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .game:
            print("travelled to game")
        case .settings:
            print("travelled to settings")
        }
    }
    
    @objc func settingsButtonPressed() {
        navigate(to: .settings)
    }
}
