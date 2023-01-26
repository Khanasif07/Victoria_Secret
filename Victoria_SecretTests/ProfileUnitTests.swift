//
//  ProfileUnitTests.swift
//  Victoria_SecretTests
//
//  Created by Admin on 26/01/23.
//

import XCTest
@testable import Victoria_Secret
final class ProfileUnitTests: XCTestCase {
    var viewModel = ProfileVM()

    func test_Profile_Api(){
        let expectation = XCTestExpectation(description: "Profile Download")
        var responseError: Error?
        var responseSuccess: Profile?
        
        viewModel.getProfileData { [weak self] results in
            guard let _ = self else { return }
            switch results{
            case .success(let products):
                responseSuccess = products
                expectation.fulfill()
            case .failure(let err):
                responseError = err
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseSuccess)
    }

}
