//
//  TitleViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/3/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol TitleViewControllerDelegate: class {
    func startGame()
}

class TitleViewController: UIViewController {

    weak var delegate: TitleViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func findButtonPressed(_ sender: Any) {
        delegate?.startGame()
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        
    }
    
}
