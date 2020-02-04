//
//  AppDelegate.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 1/30/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    let dependencies = Dependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator = AppCoordinator(window: window!, dependencies: dependencies)
        appCoordinator?.start()
        return true
    }
}

