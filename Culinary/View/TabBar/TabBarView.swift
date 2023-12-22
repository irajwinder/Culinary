//
//  TabBarView.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            SearchRecipeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            BookmarkView()
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
        }
    }
}

#Preview {
    TabBarView()
}
