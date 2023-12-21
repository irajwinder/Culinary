//
//  RecipeDetailsView.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe?

    var body: some View {
        VStack {
            LazyImage(url: URL(string: recipe?.image ?? ""))
        }
    }
}

#Preview {
    RecipeDetailsView()
}
