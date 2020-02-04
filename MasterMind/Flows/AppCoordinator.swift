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
        case title
    }
    private let window: UIWindow
    private let rootViewController: UINavigationController
    var titleCoordinator: TitleCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.rootViewController.setStyle()
        self.window.rootViewController = rootViewController
        self.window.backgroundColor = .black
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        navigate(to: .title)
    }
    
    func navigate(to destination: AppCoordinator.Destination) {
        switch destination {
        case .title:
            titleCoordinator = TitleCoordinator(navigation: rootViewController)
            titleCoordinator?.start()
        }
    }
}
