//
//  FileManagerClassTests.swift
//  CulinaryTests
//
//  Created by Rajwinder Singh on 12/22/23.
//

import XCTest
@testable import Culinary

final class FileManagerClassTests: XCTestCase {
    
    // Test saving recipe data to FileManager
    func testSaveRecipeToFileManager() {
        // Create an instance of FileManagerClass
        let manager = FileManagerClass.sharedInstance
        // Create sample image data for testing (systemName: "photo" is a placeholder)
        let imageData = UIImage(systemName: "photo")!.pngData()!
        
        // Attempt to save the image data to FileManager and get the relative path
        guard let relativeURL = manager.saveRecipeToFileManager(imageData: imageData) else {
            XCTFail("Failed to save image data to FileManager")
            return
        }
        
        // Assert that the relativeURL is not nil
        XCTAssertNotNil(relativeURL)
        // Assert that the relativeURL has the expected file extension
        XCTAssertTrue(relativeURL.hasSuffix(FileManagerConstants.fileExtension))
    }
    
    // Test loading recipe data from FileManager
    func testLoadRecipeDataFromFileManager() {
        let manager = FileManagerClass.sharedInstance
        let imageData = UIImage(systemName: "photo")!.pngData()!
        
        guard let relativeURL = manager.saveRecipeToFileManager(imageData: imageData) else {
            XCTFail("Failed to save image data to FileManager")
            return
        }
        
        let loadedImageData = manager.loadRecipeDataFromFileManager(relativePath: relativeURL)
        XCTAssertNotNil(loadedImageData)
        XCTAssertEqual(loadedImageData, imageData)
    }
    
    // Test deleting recipe data from FileManager
    func testDeleteRecipeFromFileManager() {
        let manager = FileManagerClass.sharedInstance
        let imageData = UIImage(systemName: "photo")!.pngData()!
        
        guard let relativeURL = manager.saveRecipeToFileManager(imageData: imageData) else {
            XCTFail("Failed to save image data to FileManager")
            return
        }
        
        manager.deleteRecipeFromFileManager(relativePath: relativeURL)
        let loadedImageData = manager.loadRecipeDataFromFileManager(relativePath: relativeURL)
        XCTAssertNil(loadedImageData, "Image data should be nil after deletion")
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
