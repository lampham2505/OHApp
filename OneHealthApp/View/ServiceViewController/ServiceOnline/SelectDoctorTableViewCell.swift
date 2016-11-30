//
//  SelectDoctorTableViewCell.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/30/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class SelectDoctorTableViewCell: UITableViewCell {
    @IBOutlet var imgDoctor: UIImageView!
    @IBOutlet var lblNameDoctor: UILabel!
    @IBOutlet var lblNameSpec: UILabel!
    @IBOutlet var btnOutletRating: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setListDoctor(doctor:Doctor,spec:Spec){
        lblNameDoctor.text = doctor.FullName
        lblNameSpec.text = spec.Name
    }
}
