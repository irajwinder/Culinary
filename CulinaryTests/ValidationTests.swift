//
//  ValidationTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class ValidationTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Test case to check if the name is valid
    func testIsValidName() {
        XCTAssertTrue(Validation.isValidName("ValidName")) // Should return true for a valid name
        XCTAssertFalse(Validation.isValidName(nil)) // Should return false for nil
        XCTAssertFalse(Validation.isValidName(""))
    }
    
    // Test case to check if the number is valid
    func testIsValidNumber() {
        XCTAssertTrue(Validation.isValidNumber("50")) // Should return true for a valid number
        XCTAssertFalse(Validation.isValidNumber(nil)) // Should return false for nil
        XCTAssertFalse(Validation.isValidNumber("abc"))
        XCTAssertFalse(Validation.isValidNumber("5"))  // Less than 10
        XCTAssertFalse(Validation.isValidNumber("105")) // Greater than 100
    }
}
