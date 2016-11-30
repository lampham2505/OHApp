//
//  SelectOnlineViewControllerTableViewCell.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/25/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class SelectOnlineViewControllerTableViewCell: UITableViewCell {

    @IBOutlet var imgSpec: UIImageView!
    @IBOutlet var lblSpec: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setSpec(spec:Spec){
        lblSpec.text = spec.Name
    }

}
