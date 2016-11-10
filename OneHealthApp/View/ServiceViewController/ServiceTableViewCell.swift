//
//  ServiceTableViewCell.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    var respondToButton:((_ indexpth:Int) -> Void)?
    var index:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnActionOk(_ sender: AnyObject) {
        if let callBack = self.respondToButton {
            callBack(index!)
        }
    }

}
