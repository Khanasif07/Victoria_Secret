//
//  ProductsVM.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation

class ProductsVM{
    var productListing = [Product]()
    var filteredPdttListing = [Product]()
    var listing = [Product]()
    var isFiltering: Bool = false{
        didSet{
            listing = isFiltering ? filteredPdttListing : productListing
        }
    }
    
    func getProductListing(_ completionHandler: @escaping (Result<ProductList,Error>)->Void){
        NetworkManager.shared.getDataFromServer(EndPoint.products.rawValue) { (results : Result<ProductList,Error>)  in
            switch results{
            case .success(let result):
                self.productListing = result.data.products
                self.isFiltering = false
                completionHandler(.success(result))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
