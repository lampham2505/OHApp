//
//  InfoTableViewCell.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/22/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtfInfo: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
