//
//  LoginValidationUnitTests.swift
//  Victoria_SecretTests
//
//  Created by Admin on 26/01/23.
//

import XCTest
@testable import Victoria_Secret
final class LoginValidationUnitTests: XCTestCase {

    func test_Login_Validation_EmptyString_Failure(){
        let validation = LoginValidation()
        let request = LoginModel(email: "", password: "")
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")
    }
    
    func test_LoginValidation_With_EmptyEmail_Failure(){
        let validation = LoginValidation()
        let request = LoginModel(email: "", password: "test")
        let result = validation.validate(request: request)
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, LocalizedString.pleaseEnterEmail.localized)
    }

    func test_LoginValidation_With_EmptyPassword_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginModel(email: "test", password: "")
        let result = validation.validate(request: request)
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, LocalizedString.pleaseEnterPassword.localized)

    }

    func test_LoginValidation_With_InvalidEmailId_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginModel(email: "test", password: "test")
        let result = validation.validate(request: request)

        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, LocalizedString.pleaseEnterValidEmail.localized)
    }

    func test_LoginValidation_With_ValidRequest_Returns_failure(){
        let validation = LoginValidation()
        let request = LoginModel(email: "asif@gmail.com", password: "test")
        let result = validation.validate(request: request)
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, LocalizedString.pleaseEnterValidPassword.localized)
    }
    
    func test_LoginValidation_With_ValidRequest_Returns_Success(){
        let validation = LoginValidation()
        let request = LoginModel(email: "asif@gmail.com", password: "Asif@12")
        let result = validation.validate(request: request)
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
   
}
