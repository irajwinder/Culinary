//
//  DataManagerTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class DataManagerTests: XCTestCase {
    
    // Test case to check the functionality of saving a bookmark.
    func testSaveBookmark() {
        // Create an instance of DataManager.
        let manager = DataManager.sharedInstance
        // Define a bookmark URL for testing.
        let bookmarkURL = "BookmarkedRecipes/abc123.jpg"
        
        // Call the saveBookmark method of the DataManager with the test bookmark URL.
        manager.saveBookmark(bookmarkURL: bookmarkURL)
        
        // Fetch bookmarks and assert that the saved bookmark URL is present.
        let bookmarks = manager.fetchBookmark()
        XCTAssertTrue(bookmarks.contains { $0.bookmarkURL == bookmarkURL })
    }
    
    // Test case to check the functionality of fetching bookmarks.
    func testFetchBookmark() {
        let manager = DataManager.sharedInstance
        let bookmarkURL = "BookmarkedRecipes/abc123.jpg"
        
        manager.saveBookmark(bookmarkURL: bookmarkURL)
        
        let bookmarks = manager.fetchBookmark()
        XCTAssertTrue(bookmarks.contains { $0.bookmarkURL == bookmarkURL })
    }
    
    // Test case to check the functionality of deleting a bookmark entity.
    func testDeleteEntity() {
        let manager = DataManager.sharedInstance
        let bookmarkURL = "BookmarkedRecipes/abc123.jpg"
        
        manager.saveBookmark(bookmarkURL: bookmarkURL)
        let bookmarksBeforeDeletion = manager.fetchBookmark()
        
        guard let bookmarkToDelete = bookmarksBeforeDeletion.first else {
            XCTFail("No bookmark to delete")
            return
        }
        
        manager.deleteEntity(bookmarkToDelete)
        let bookmarksAfterDeletion = manager.fetchBookmark()
        
        XCTAssertFalse(bookmarksAfterDeletion.contains { $0.bookmarkURL == bookmarkURL })
    }    
}
