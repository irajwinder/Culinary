//
//  ValidationTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class ValidationTests: XCTestCase {
    
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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
