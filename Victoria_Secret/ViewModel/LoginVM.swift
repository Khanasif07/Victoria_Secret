//
//  LoginVM.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
struct LoginVM {
    var model = LoginModel()
    private let validation = LoginValidation()
    
    func authenticateUser()-> ValidationResponse {
       let response = validation.validate(request: model)
       return response
    }
}

