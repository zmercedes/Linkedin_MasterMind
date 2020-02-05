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
    
    @IBOutlet weak var previousTriesButton: UIButton!
    @IBOutlet weak var triesTableView: UITableView!
    
    var currentCombination: String
    
    init(combination: String?) {
        currentCombination = combination ?? ""
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessField.attributedPlaceholder = NSAttributedString(string: "guess here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        guessField.addTarget(self, action: #selector(onEditNextToggle(_:)), for: .editingChanged)
        
        var encode: String = ""
        for _ in 0..<currentCombination.count {
            encode = encode + "X"
        }
        encodedNumber.text = encode
    }
    
    @objc func onEditNextToggle(_ textField: UITextField) {
        tryButton.isEnabled = textField.text != ""
    }

    @IBAction func tryButtonPressed(_ sender: Any) {
        
        displayResults()
    }

    @IBAction func previousTriesPressed(_ sender: Any) {
        let hidden = triesTableView.isHidden
        let buttonText = hidden ? "close" : "previous tries"
        previousTriesButton.setTitle(buttonText, for: .normal)
        triesTableView.isHidden = !hidden
    }
    
    private func displayResults() {
        if !resultsView.isHidden {
            resultsView.isHidden = true
        }
        let guess = guessField.text ?? ""
        if guess.count < currentCombination.count {
            resultLabel.text = "Not enough digits, try again."
            placeLabel.text = ""
        } else if guess.count > currentCombination.count {
            resultLabel.text = "Too many digits, try again."
            placeLabel.text = ""
        } else {
            let matches = currentCombination.match(other: guess)
            let resultText = matches[0] > 0 ? "\(matches[0]) digits matched!" : "No digits matched."
            let placeText = matches[1] > 0 ? "\(matches[1]) matched in right place!" : ""
            resultLabel.text = resultText
            placeLabel.text = placeText
        }
        resultsView.isHidden = false
    }
}
