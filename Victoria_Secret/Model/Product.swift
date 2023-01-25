//
//  Product.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation

import Foundation

// MARK: - Welcome
struct ProductList: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id, brand, name, productDesc: String
    let price, offerPrice: String
    let productURL: String

    enum CodingKeys: String, CodingKey {
        case id, brand, name, productDesc, price, offerPrice
        case productURL = "productUrl"
    }
}
