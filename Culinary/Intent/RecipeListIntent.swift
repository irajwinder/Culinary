//
//  RecipeListIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

class RecipeListIntent: ObservableObject {
    
    func saveBookmark(recipe: Recipe) {
        guard let imageURL = URL(string: recipe.image) else {
            return
        }
        
        // Download image
        NetworkManager.sharedInstance.downloadImage(from: imageURL) { [weak self] imageData in
            guard let self = self, let imageData = imageData else {
                return
            }
            // Save the image data to FileManager
            if let relativeURL = FileManagerClass.sharedInstance.saveRecipeToFileManager(imageData: imageData, recipe: recipe) {
                // Save the relative URL to CoreData
                DataManager.sharedInstance.saveBookmark(recipeURL: relativeURL)
            }
        }
    }
}
