//
//  QuestionTabTableViewCell.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/21/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class QuestionTabTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
