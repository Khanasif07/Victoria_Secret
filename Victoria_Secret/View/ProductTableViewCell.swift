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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productNameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        productDescLbl.font = UIFont.boldSystemFont(ofSize: 14)
        priceLbl.font = UIFont.boldSystemFont(ofSize: 13.5)
        productDescLbl.textColor = .lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImgView.image = nil
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImgView.layer.cornerRadius = 5.0
    }
    
    func populateCell(_ model: Product){
        productNameLbl.text = model.name
        productDescLbl.text = model.productDesc
        priceLbl.text = "INR \(model.price)"
        productImgView.setImageFromUrl(ImageURL: model.productURL)
    }
    
}
