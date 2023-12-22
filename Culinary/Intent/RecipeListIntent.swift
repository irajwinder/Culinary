//
//  RecipeListIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI


class RecipeListIntent: ObservableObject {
    
    func saveBookmark<T: Codable>(item: T) {
        guard let imageURL = URL(string: getImageURL(item: item)) else {
            return
        }
        
        // Download image
        NetworkManager.sharedInstance.downloadImage(from: imageURL) { [weak self] imageData in
            guard let self = self, let imageData = imageData else {
                return
            }
            // Save the image data to FileManager
            if let relativeURL = FileManagerClass.sharedInstance.saveRecipeToFileManager(imageData: imageData) {
                // Save the relative URL to CoreData
                DataManager.sharedInstance.saveBookmark(bookmarkURL: relativeURL)
            }
        }
    }
    
    func getImageURL<T: Codable>(item: T) -> String {
        if let recipe = item as? Recipe {
            return recipe.image
        } else if let nutrient = item as? Nutrient {
            return nutrient.image
        } else if let ingredient = item as? Ingredient {
            return ingredient.image
        } else {
            return ""
        }
    }
}
