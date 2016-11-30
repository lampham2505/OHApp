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
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet var lblContent: UILabel!
    @IBOutlet var imgAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func QuestionList(question:Question){
        lblHeader.text = question.Title
        lblTime.text = question.times
        lblContent.text = question.content
        if question.ListImage.count > 0 {
//            question.ListImage[0]["11-44.jpg"]
        }
    }
}
