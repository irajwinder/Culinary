//
//  ListView.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

struct ListView: View {
    @StateObject private var stateObject = RecipeListIntent()
    @ObservedObject var observedObject: SearchRecipeIntent
    
    @State private var showAlert = false
    @State private var alert: Alert?
    
    var body: some View {
        List {
            ForEach(observedObject.recipesResponse, id: \.id) { recipe in
                HStack {
                    LazyImage(url: URL(string: recipe.image))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(recipe.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("Recipe Number: \(recipe.id)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                CustomBookmarkButton {
                    stateObject.saveBookmark(recipe: recipe)
                    self.showAlert = true
                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
                }
            }
            
            ForEach(observedObject.nutrientResponse, id: \.id) { nutrient in
                HStack {
                    LazyImage(url: URL(string: nutrient.image))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(nutrient.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("Recipe Number: \(nutrient.id)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Calories: \(nutrient.calories)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Protein: \(nutrient.protein)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Fat: \(nutrient.fat)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Carb: \(nutrient.carbs)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
//                CustomBookmarkButton {
//                    stateObject.saveBookmark(recipe: recipe)
//                    self.showAlert = true
//                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
//                }
            }
            
            ForEach(observedObject.ingredientResponse, id: \.id) { ingredient in
                HStack {
                    LazyImage(url: URL(string: ingredient.image))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(ingredient.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("Recipe Number: \(ingredient.id)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Used Ingredient(s): \(ingredient.usedIngredientCount)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Missed Ingredient(s): \(ingredient.missedIngredientCount)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
//                CustomBookmarkButton {
//                    stateObject.saveBookmark(recipe: recipe)
//                    self.showAlert = true
//                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
//                }
            }
        }
        .navigationBarTitle("Recipe List")
        .alert(isPresented: $showAlert) {
            alert!
        }
    }
}

#Preview {
    ListView(observedObject: SearchRecipeIntent())
}
