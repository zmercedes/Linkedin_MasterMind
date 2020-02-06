//
//  SettingsViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func updateValues()
    func dismissed()
}

class SettingsViewController: CustomAlertViewController {
    
    @IBOutlet weak var alert: UIView!
    @IBOutlet weak var minimumDigitsField: UITextField!
    @IBOutlet weak var minimumNumberField: UITextField!
    @IBOutlet weak var maximimNumberField: UITextField!
    
    private let minimumDigits: Int
    private let minimumNumber: Int
    private let maximumNumber: Int
    
    weak var delegate: SettingsViewControllerDelegate?
    
    init(settings: Settings) {
        minimumDigits = settings.digitLength
        minimumNumber = settings.minValue
        maximumNumber = settings.maxValue
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert.setStyle()
        alertView = alert
        minimumDigitsField.text = String(minimumDigits)
        minimumNumberField.text = String(minimumNumber)
        maximimNumberField.text = String(maximumNumber)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) { [unowned self] in
            self.delegate?.dismissed()
        }
    }
    
}
