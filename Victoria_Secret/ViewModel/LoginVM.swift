//
//  LoginVM.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation

protocol LogInVMDelegate: NSObjectProtocol {
    func signInSuccess()
    func signInFailed(message: String)
    func emailNotVerified(message: String)
}

struct LoginVM {
    
    var model = LoginModel()
    weak var delegate: LogInVMDelegate?
    
    func signIn(_ parameters: [String:Any]) {
        
    }
    
    func checkSignInValidations(parameters: [String:Any]) -> (status: Bool, message: String) {
        var validationStatus = true
        var errorMessage = ""
        guard let email = parameters["email"] as? String,!email.isEmpty  else{
            validationStatus = false
            errorMessage = LocalizedString.pleaseEnterEmail.localized
            return (status: validationStatus, message: errorMessage)
        }
        
        if !email.checkIfValid(.email) {
            validationStatus = false
            errorMessage =  LocalizedString.pleaseEnterValidEmail.localized
            return (status: validationStatus, message: errorMessage)
        }
        
        guard let password = parameters["password"] as? String, !password.isEmpty  else{
            validationStatus = false
            errorMessage = LocalizedString.pleaseEnterPassword.localized
            return (status: validationStatus, message: errorMessage)
        }
        
        if !password.checkIfValid(.password) {
            validationStatus = false
            errorMessage = LocalizedString.pleaseEnterValidPassword.localized
            return (status: validationStatus, message: errorMessage)
        }
        return (status: validationStatus, message: errorMessage)
    }
}
