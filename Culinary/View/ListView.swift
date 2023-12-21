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
                    VStack(alignment: .leading, spacing: 8) {
                        LazyImage(url: URL(string: recipe.image))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(recipe.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text("Recipe Number: \(recipe.id)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    }
                }
                CustomBookmarkButton {
                    stateObject.saveBookmark(recipe: recipe)
                    self.showAlert = true
                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
                }
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
