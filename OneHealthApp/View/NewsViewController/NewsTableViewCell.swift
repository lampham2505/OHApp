//
//  NewsTableViewCell.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/5/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var lblAnswer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
