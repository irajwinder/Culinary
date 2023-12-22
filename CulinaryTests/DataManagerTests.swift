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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
