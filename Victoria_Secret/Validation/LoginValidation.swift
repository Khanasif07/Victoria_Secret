//
//  LoginValidation.swift
//  Victoria_Secret
//
//  Created by Admin on 26/01/23.
//

import Foundation

struct LoginValidation {
    
    func validate(request: LoginModel) -> ValidationResponse {
        guard !request.email.isEmpty  || !request.password.isEmpty else {
            return ValidationResponse(message: "email or password cannot be empty", isValid: false)
        }
        
        guard !request.email.isEmpty else {
            return ValidationResponse(message: LocalizedString.pleaseEnterEmail.localized, isValid: false)
        }
        
        guard !request.password.isEmpty else {
            return ValidationResponse(message: LocalizedString.pleaseEnterPassword.localized, isValid: false)
        }
        
        guard request.email.checkIfValid(.email) else {
            return ValidationResponse(message: LocalizedString.pleaseEnterValidEmail.localized, isValid: false)
        }
        
        guard request.password.checkIfValid(.password) else {
            return ValidationResponse(message: LocalizedString.pleaseEnterValidPassword.localized, isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
}
