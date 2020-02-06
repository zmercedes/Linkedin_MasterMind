//
//  GameViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func requestDigits() -> String?
    func gameOver()
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var encodedNumber: UILabel!
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryButton: UIButton!
    
    @IBOutlet weak var previousTriesButton: UIButton!
    @IBOutlet weak var triesTableView: UITableView!
    @IBOutlet weak var triesTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    weak var delegate: GameViewControllerDelegate?
    
    private var currentCombination: String = ""
    private var guesses: [String] = []
    private var guessDict: [String:[Int]] = [:]
    private var victory: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        resultsView.layer.cornerRadius = 6
        resultsView.layer.borderWidth = 1
        resultsView.layer.borderColor = UIColor.white.cgColor
        if let newCombo = delegate?.requestDigits() {
            currentCombination = newCombo
            print(currentCombination)
        } else {
            error()
        }
        guessField.attributedPlaceholder = NSAttributedString(string: "guess here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        guessField.addTarget(self, action: #selector(onEditNextToggle(_:)), for: .editingChanged)
        
        triesTableView.dataSource = self
        triesTableView.register(GuessTableViewCell.self)
        
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
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        reset()
    }
    
    @IBAction func quitButtonPressed(_ sender: Any) {
        delegate?.gameOver()
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
        } else if guessDict[guess] != nil {
            resultLabel.text = "Already tried this, try again."
            placeLabel.text = ""
        } else {
            let matches = currentCombination.match(other: guess)
            victory = matches[0] == 4 && matches[1] == 4
            let resultText = matches[0] > 0 ? "\(matches[0]) digits matched!" : "No digits matched."
            let placeText = matches[1] > 0 ? "\(matches[1]) matched in right place!" : ""
            resultLabel.text = resultText
            placeLabel.text = placeText
            guesses.append(guess)
            guessDict[guess] = matches
        }
        if victory {
            success()
        } else {
            if guesses.count == 10 {
                failure()
            }
        }
        triesTableViewHeight.constant = guesses.count > 0 ? CGFloat(42*guesses.count) : 42
        triesTableView.reloadData()
        resultsView.isHidden = false
        guessField.text = ""
    }
    
    private func success() {
        let alertTitle = "Success!"
        let body = "You've cracked this target, great job."
        let alert = ResultsViewController(title: alertTitle, body: body)
        self.present(alert, animated: true, completion: nil)
        nextButton.isHidden = false
        quitButton.isHidden = false
    }
    
    private func failure() {
        let alertTitle = "Failed!"
        let body = "You couldn't crack this target. You are now being tracked by the authorities. I suggest you run, now."
        let alert = ResultsViewController(title: alertTitle, body: body) { [unowned self] in
            self.delegate?.gameOver()
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func error() {
        let alertTitle = "Error"
        let body = "Could not find any target (network error). Try again later."
        let alert = ResultsViewController(title: alertTitle, body: body) { [unowned self] in
            self.delegate?.gameOver()
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func reset() {
        nextButton.isHidden = true
        quitButton.isHidden = true
        resultsView.isHidden = true
        guessField.text = ""
        guesses = []
        guessDict = [:]
        victory = false
        triesTableViewHeight.constant = 42
        triesTableView.reloadData()
        if let newCombo = delegate?.requestDigits() {
            currentCombination = newCombo
            print(currentCombination)
        } else {
            error()
        }
    }
}

extension GameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GuessTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let guessNumber = indexPath.row
        let guess = guesses[guessNumber]
        let result = guessDict[guess]
        
        cell.attemptNumberLabel.text = "\(guessNumber + 1)"
        cell.attemptValueLabel.text = guess
        cell.resultsLabel.text = "\(result![0]) ✔️ \(result![1]) ☑️"
        return cell
    }
}
