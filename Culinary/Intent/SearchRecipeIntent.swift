//
//  SearchRecipeIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

class SearchRecipeIntent: ObservableObject {
    @Published var recipesResponse: [Recipe] = []
    @Published var searchText = ""
    
    func searchRecipes() {
        NetworkManager.sharedInstance.searchRecipes(query: searchText) { [weak self] response in
            guard let self = self, let response = response?.results else {
                print("Failed to fetch photos")
                return
            }
            DispatchQueue.main.async {
                self.recipesResponse.append(contentsOf: response)
            }
            print(response)
            print(searchText)
        }
    }
}
