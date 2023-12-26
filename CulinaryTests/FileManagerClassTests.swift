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
}
