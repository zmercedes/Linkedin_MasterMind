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
    func startSettings()
}

class TitleViewController: UIViewController {
    
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var aboutButton: UIButton!
    
    weak var delegate: TitleViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.setStyle()
    }
    
    @IBAction func findButtonPressed(_ sender: Any) {
        delegate?.startGame()
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        delegate?.startSettings()
    }
    
    @IBAction func aboutButtonPressed(_ sender: Any) {
        let hidden = aboutView.isHidden
        let buttonText = hidden ? "Close" : "About"
        aboutButton.setTitle(buttonText, for: .normal)
        aboutView.isHidden = !hidden
    }
    
}
