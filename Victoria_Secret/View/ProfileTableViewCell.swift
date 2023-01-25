//
//  ProfileTableViewCell.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        subTitleLbl.font = UIFont.boldSystemFont(ofSize: 14)
        subTitleLbl.textColor = .lightGray
    }
    
    func populateCell(_ tuple: (String,String)){
        titleLbl.text = tuple.0
        subTitleLbl.text = tuple.1
    }
}
