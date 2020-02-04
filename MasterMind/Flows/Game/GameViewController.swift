//
//  GameViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var encodedNumber: UILabel!
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryButton: UIButton!
    
    var currentCombination: [Int]
    
    init(combination: [Int]?) {
        currentCombination = combination ?? []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessField.attributedPlaceholder = NSAttributedString(string: "guess here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        var combo = ""
        for digit in currentCombination {
            combo += "\(digit)"
        }
        encodedNumber.text = combo
    }

    @IBAction func tryButtonPressed(_ sender: Any) {
        
    }
}
