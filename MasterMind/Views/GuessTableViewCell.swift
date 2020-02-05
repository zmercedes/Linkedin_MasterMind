//
//  GuessTableViewCell.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class GuessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var attemptNumberLabel: UILabel!
    @IBOutlet weak var attemptValueLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        attemptNumberLabel.text = "0"
        attemptValueLabel.text = "8888"
        resultsLabel.text = "0 ✔️ 0 ☑️"
    }
    
}
