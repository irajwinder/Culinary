//
//  BookmarkIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation
import SwiftUI

class BookmarkIntent: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    
    func fetchBookmarks() {
        bookmarks = DataManager.sharedInstance.fetchBookmark()
    }
    
    func deleteBookmark(offsets: IndexSet) {
        offsets.forEach { index in
            let bookmark = bookmarks[index]
            
            // Delete from FileManager
            FileManagerClass.sharedInstance.deleteRecipeFromFileManager(relativePath: bookmark.bookmarkURL ?? "")
            
            // Delete from CoreData
            DataManager.sharedInstance.deleteEntity(bookmark)
        }
        
        // Update the local array after deletion
        bookmarks.remove(atOffsets: offsets)
    }
}
