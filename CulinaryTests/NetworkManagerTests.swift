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
}
