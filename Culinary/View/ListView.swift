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
                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                    LazyImage(url: URL(string: recipe.image))
                }
                CustomBookmarkButton {
                    stateObject.saveBookmark(recipe: recipe)
                    self.showAlert = true
                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
                }
                .onAppear(perform: {
                    // Check if the current photo is the last one
//                    if recipe.id == observedObject.recipesResponse.last?.id {
//                        // Load the next page when the last photo is reached
//                        observedObject.currentPage += 1
//                        observedObject.searchRecipes()
//                        print(observedObject.currentPage)
//                    }
                })
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
