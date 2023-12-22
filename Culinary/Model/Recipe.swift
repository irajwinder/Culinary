//
//  Recipe.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

struct RecipeResponse: Codable {
    let results: [Recipe]
    let number: Int
    let totalResults: Int
}

struct Recipe: Codable {
    let id: Int
    let title: String
    let image: String
}

struct Nutrient: Codable {
    let id: Int
    let title: String
    let image: String
    let calories: Int
    let protein: String
    let fat: String
    let carbs: String
}

struct Ingredient: Codable {
    let id: Int
    let title: String
    let image: String
    let usedIngredientCount: Int
    let missedIngredientCount: Int
}
