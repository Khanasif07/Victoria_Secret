//
//  ProductTableViewCell.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productDescLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
    var rewardBtnAction: (() -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productNameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        productDescLbl.font = UIFont.boldSystemFont(ofSize: 14)
        priceLbl.font = UIFont.boldSystemFont(ofSize: 13.5)
        productDescLbl.textColor = .lightGray
        bottomView.isHidden = true
    }
    
    @IBAction func rewardBtnAction(_ sender: UIButton) {
        if let handle = rewardBtnAction{
            handle()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImgView.image = nil
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImgView.layer.cornerRadius = 5.0
    }
    
    func populateCell(_ model: Product,_ isRewardCell: Bool = false){
        productNameLbl.text = model.name
        productDescLbl.text = model.productDesc
        priceLbl.text = "INR \(model.price)"
        productImgView.setImageFromUrl(ImageURL: model.productURL)
        bottomView.isHidden = !isRewardCell
    }
    
}
