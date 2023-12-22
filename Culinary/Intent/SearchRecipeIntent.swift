//
//  SearchRecipeIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

class SearchRecipeIntent: ObservableObject {
    @Published var recipesResponse: [Recipe] = []
    @Published var nutrientResponse: [Nutrient] = []
    @Published var ingredientResponse: [Ingredient] = []
    
    @Published var searchText = ""
    @Published var minCarbs = ""
    @Published var maxCarbs = ""
    @Published var selectedSearchType = SearchType.recipe
    
    func searchRecipes() {
        NetworkManager.sharedInstance.searchRecipes(query: searchText) { [weak self] response in
            guard let self = self, let response = response?.results else {
                print("Failed to fetch photos")
                return
            }
            DispatchQueue.main.async {
                self.recipesResponse.append(contentsOf: response)
            }
        }
    }
    
    func searchByNutriants() {
        NetworkManager.sharedInstance.filterRecipesByNutrients(minCarbs: Int(minCarbs) ?? 0, maxCarbs: Int(maxCarbs) ?? 0) { [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch Nutriant")
                return
            }
            DispatchQueue.main.async {
                self.nutrientResponse.append(contentsOf: response)
            }
        }
    }
    
    func searchByIngredients() {
        NetworkManager.sharedInstance.filterRecipesByIngredients(query: searchText){ [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch Nutriant")
                return
            }
            DispatchQueue.main.async {
                self.ingredientResponse.append(contentsOf: response)
            }
        }
    }
}
