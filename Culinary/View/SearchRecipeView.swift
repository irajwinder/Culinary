//
//  SearchRecipeView.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

enum SearchType: String, CaseIterable {
    case recipe = "Recipe"
    case nutrient = "Nutrient"
    case ingredient = "Ingredient"
}

struct SearchRecipeView: View {
    @StateObject private var stateObject = SearchRecipeIntent()
    @State private var navigateToListView = false
    @State private var showAlert = false
    @State private var alert: Alert?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    if stateObject.selectedSearchType == .nutrient {
                        HStack {
                            TextField("Min Carbs", text: $stateObject.minCarbs)
                                .keyboardType(.numberPad)
                            TextField("Max Carbs", text: $stateObject.maxCarbs)
                                .keyboardType(.numberPad)
                        }
                    } else {
                        CustomSearchField(placeholder: "Enter search text", searchText: $stateObject.searchText)
                    }
                    
                    CustomSearchButton {
                        validateSearch()
                    }
                }
                
                Picker("Search Type", selection: $stateObject.selectedSearchType) {
                    ForEach(SearchType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
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
                stateObject.nutrientResponse = []
                stateObject.ingredientResponse = []
                
                let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])
            }
        }
    }
    
    func validateSearch() {
        if stateObject.selectedSearchType == .nutrient {
            guard Validation.isValidNumber(stateObject.minCarbs) else {
                showAlert = true
                alert = Validation.showAlert(title: "Error", message: "Enter a valid min value(10..100)")
                return
            }
            
            guard Validation.isValidNumber(stateObject.maxCarbs) else {
                showAlert = true
                alert = Validation.showAlert(title: "Error", message: "Enter a valid max value(10..100)")
                return
            }
        } else {
            guard Validation.isValidName(stateObject.searchText) else {
                showAlert = true
                alert = Validation.showAlert(title: "Error", message: "Enter Search Text")
                return
            }
        }
        
        switch stateObject.selectedSearchType {
        case .recipe:
            stateObject.searchRecipes()
            navigateToListView = true
        case .nutrient:
            stateObject.searchByNutriants()
            navigateToListView = true
        case .ingredient:
            stateObject.searchByIngredients()
            navigateToListView = true
        }
    }
}

#Preview {
    SearchRecipeView()
}
