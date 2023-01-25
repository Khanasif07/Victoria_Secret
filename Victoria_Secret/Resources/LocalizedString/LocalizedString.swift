//
//  LocalizedString.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
enum LocalizedString : String {
    
    case name
    case email
    case password
    case logout
    
    // MARK: - Validation Messages
    //==================================
    case pleaseEnterValidEmail  = "Please Enter Valid Email"
    case pleaseEnterValidPassword = "Please Enter Valid Password"
    case pleaseEnterEmail = "Please Enter Email"
    case pleaseEnterPassword = "Please Enter Password"
}

extension LocalizedString {
    var localized : String {
        return self.rawValue
    }
}
