//
//  Dependencies.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

final class Dependencies {
    private lazy var settingsStore = SettingsStore()
    lazy var settings = Settings(store: settingsStore)
}
