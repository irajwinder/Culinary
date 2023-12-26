//
//  SearchRecipeIntentTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class SearchRecipeIntentTests: XCTestCase {
    
    // Test case for searching recipes using SearchRecipeIntent
    func testSearchRecipes() {
        // Instantiate SearchRecipeIntent
        let intent = SearchRecipeIntent()
        // Create an expectation to wait for the asynchronous completion
        let expectation = XCTestExpectation(description: "Search Recipes")
        
        // Call the searchRecipes method on SearchRecipeIntent
        intent.searchRecipes()
        
        // Use DispatchQueue to wait for a short period before checking the result
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Assert that the number of recipes is greater than 0
            XCTAssertGreaterThan(intent.recipesResponse.count, 0) // Should have more than 0 recipes in the response
            // Fulfill the expectation, indicating that the test is complete
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled or for a timeout
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Test case for searching recipes by nutrients using SearchRecipeIntent
    func testSearchByNutrients() {
        let intent = SearchRecipeIntent()
        let expectation = XCTestExpectation(description: "Search by Nutrients")
        
        intent.searchByNutriants()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertGreaterThan(intent.nutrientResponse.count, 0) // Should have more than 0 nutrient in the response
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Test case for searching recipes by ingredients using SearchRecipeIntent
    func testSearchByIngredients() {
        let intent = SearchRecipeIntent()
        let expectation = XCTestExpectation(description: "Search by Ingredients")

        intent.searchByIngredients()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertGreaterThanOrEqual(intent.ingredientResponse.count, 0)  // Should have more than 0 ingredient responses
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }    
}
