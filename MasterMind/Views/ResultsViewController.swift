//
//  ResultsViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ResultsViewController: CustomAlertViewController {

    @IBOutlet weak var alert: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var okAction: (() -> Void)?
    var titleText: String
    var bodyText: String
    
    init(title: String, body: String, action: (() -> Void)? = nil) {
        self.titleText = title
        self.bodyText = body
        okAction = action
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        bodyLabel.text = bodyText
        alert.layer.cornerRadius = 6
        alert.layer.borderWidth = 1
        alert.layer.borderColor = UIColor.white.cgColor
        alertView = alert
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.okAction?()
        }
    }
    
}
