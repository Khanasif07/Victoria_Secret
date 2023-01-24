//
//  LocalizedString.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
enum LocalizedString : String {
    
    // MARK:- App Title
    //===================
    case name
    case email
    case password
    case logout
    
    // MARK: - Validation Messages
    //==================================
    case pleaseEnterValidEmail  = "pleaseEnterValidEmail"
    case pleaseEnterValidPassword = "pleaseEnterValidPassword"
    case pleaseEnterEmail = "pleaseEnterEmail"
    case enterYourEmailId = "enterYourEmailId"
    case pleaseEnterPassword = "pleaseEnterPassword"
}

extension LocalizedString {
    var localized : String {
        return self.rawValue
    }
}
