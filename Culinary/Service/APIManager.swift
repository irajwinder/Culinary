//
//  APIManager.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

class APIManager: NSObject {
    static let sharedInstance: APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    // Decode Recipe response
    func decodeRecipeResponse(data: Data) -> RecipeResponse? {
        do {
            let decoder = JSONDecoder()
            let recipeSearchResponse = try decoder.decode(RecipeResponse.self, from: data)
            return recipeSearchResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Decode Nutrient response
    func decodeNutrientResponse(data: Data) -> [Nutrient]? {
        do {
            let decoder = JSONDecoder()
            let nutrientResponse = try decoder.decode([Nutrient].self, from: data)
            return nutrientResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Decode Ingredient response
    func decodeIngredientResponse(data: Data) -> [Ingredient]? {
        do {
            let decoder = JSONDecoder()
            let ingredientResponse = try decoder.decode([Ingredient].self, from: data)
            return ingredientResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
