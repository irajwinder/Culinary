//
//  FileManagerClass.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

class FileManagerClass: NSObject {
    
    static let sharedInstance: FileManagerClass = {
        let instance = FileManagerClass()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    func saveRecipeToFileManager(imageData: Data, recipe: Recipe) -> String? {
        let recipeID = String(recipe.id)
        
        // folder name and file name based on recipe ID
        let folderName = "BookmarkedRecipes"
        let fileName = "\(recipeID).jpg"
        let relativeURL = "\(folderName)/\(fileName)"
        
        do {
            // Get the documents directory URL
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent(relativeURL)
            
            // Create the necessary directory structure if it doesn't exist
            try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
            
            // Write the image data to the file at the specified URL
            try imageData.write(to: fileURL)
            return relativeURL
        } catch {
            // Print an error message if any issues occur during the image-saving process
            print("Error saving image:", error.localizedDescription)
            return nil
        }
    }
    
    
    func loadRecipeDataFromFileManager(relativePath: String) -> Data? {
        // Construct the local file URL by appending the relative path to the documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let localFileURL = documentsDirectory.appendingPathComponent(relativePath)
        
        do {
            // Read image data from the local file
            let imageData = try Data(contentsOf: localFileURL)
            return imageData
        } catch {
            print("Error loading image data:", error.localizedDescription)
            return nil
        }
    }
    
    func deleteRecipeFromFileManager(relativePath: String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let localFileURL = documentsDirectory.appendingPathComponent(relativePath)
        
        do {
            try FileManager.default.removeItem(at: localFileURL)
            print("Image deleted from file manager:", localFileURL)
        } catch {
            print("Error deleting image from file manager:", error.localizedDescription)
        }
    }
}
