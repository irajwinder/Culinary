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
}
