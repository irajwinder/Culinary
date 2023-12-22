//
//  NetworkManagerTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class NetworkManagerTests: XCTestCase {
    
    // Test case for searching recipes
    func testSearchRecipes() {
        // Create an expectation to wait for the asynchronous completion
        let expectation = XCTestExpectation(description: "Search Recipes")
        // Instantiate the NetworkManager
        let manager = NetworkManager.sharedInstance
        
        // Call the searchRecipes method with a query
        manager.searchRecipes(query: "Pasta") { response in
            // Assert that the response is not nil
            XCTAssertNotNil(response) // Should receive a non-nil response
            // Fulfill the expectation, indicating that the test is complete
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled or for a timeout
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Test case for filtering recipes by nutrients
    func testFilterRecipesByNutrients() {
        let expectation = XCTestExpectation(description: "Filter Recipes by Nutrients")
        let manager = NetworkManager.sharedInstance
        
        manager.filterRecipesByNutrients(minCarbs: 10, maxCarbs: 50) { response in
            XCTAssertNotNil(response) // Should receive a non-nil response
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Test case for filtering recipes by ingredients
    func testFilterRecipesByIngredients() {
        let expectation = XCTestExpectation(description: "Filter Recipes by Ingredients")
        let manager = NetworkManager.sharedInstance
        
        manager.filterRecipesByIngredients(query: "Chicken") { response in
            XCTAssertNotNil(response) // Should receive a non-nil response
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
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
