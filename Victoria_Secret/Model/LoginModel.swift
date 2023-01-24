//
//  LoginModel.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
struct LoginModel{
    var email: String = ""
    var password: String = ""
    
    init(){}
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
