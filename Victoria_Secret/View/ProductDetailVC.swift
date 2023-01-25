//
//  ProductDetailVC.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var productOffPriceLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productSubTitleLbl: UILabel!
    @IBOutlet weak var productTitleLbl: UILabel!
    @IBOutlet weak var productImgView: UIImageView!
    
    private var viewModel : ProductDetailVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
        navigationItem.backButtonTitle = ""
        self.title = "Product Detail"
    }
    
    public func setUpViewModel(_ product: Product){
        let productVM = ProductDetailVM(product: product)
        self.viewModel = productVM
    }
    
    private func setupFont(){
        productTitleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        productPriceLbl.font = UIFont.boldSystemFont(ofSize: 14)
        productOffPriceLbl.font = UIFont.boldSystemFont(ofSize: 14)
        productSubTitleLbl.font = UIFont.boldSystemFont(ofSize: 14)
        [productSubTitleLbl,productPriceLbl,productOffPriceLbl].forEach({$0?.textColor = .lightGray})
    }

    private func initialSetUp(){
        self.setupFont()
        self.productTitleLbl.text = self.viewModel?.product?.name ?? "NA"
        self.productSubTitleLbl.text = self.viewModel?.product?.productDesc ?? "NA"
        self.productPriceLbl.text = "INR \(self.viewModel?.product?.price ?? "NA")"
        self.productOffPriceLbl.text = "INR \(self.viewModel?.product?.offerPrice ?? "NA")"
        self.productImgView.setImageFromUrl(ImageURL:self.viewModel?.product?.productURL ?? "")
    }

}
