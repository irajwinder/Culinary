//
//  SearchRecipeView.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

struct SearchRecipeView: View {
    @StateObject private var stateObject = SearchRecipeIntent()
    @State private var navigateToListView = false
    @State private var showAlert = false
    @State private var alert: Alert?

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    CustomSearchField(placeholder: "Enter search text", searchText: $stateObject.searchText)

                    CustomSearchButton {
                        validateSearch()
                    }
                }

            }
            .navigationBarTitle("Search")
            .alert(isPresented: $showAlert) {
                alert!
            }
            .navigationDestination(isPresented: $navigateToListView) {
                ListView(observedObject: stateObject)
            }
            .padding()
            .onAppear {
                stateObject.recipesResponse = []
                let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])
            }
        }
    }
    
    func validateSearch() {
        guard Validation.isValidName(stateObject.searchText) else {
            showAlert = true
            alert = Validation.showAlert(title: "Error", message: "Enter Search Text")
            return
        }
        
        stateObject.searchRecipes()
        navigateToListView = true
    }
}

#Preview {
    SearchRecipeView()
}
