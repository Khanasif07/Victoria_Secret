//
//  Profile.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation

struct Profile: Codable {
    let id, username, firstname, lastName: String
    let dob, address, pointsEarned, walletBalance: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, firstname, lastName, dob, address
        case pointsEarned
        case walletBalance
    }
}
