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
    
    private func localFileURL(forRelativePath relativePath: String) -> URL {
        // Get the documents directory URL
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(relativePath)
    }
    
    func saveRecipeToFileManager(imageData: Data) -> String? {
        // folder name and file name
        let folderName = FileManagerConstants.folderName
        let fileName = UUID().uuidString + FileManagerConstants.fileExtension
        let relativeURL = "\(folderName)/\(fileName)"
        
        let fileURL = localFileURL(forRelativePath: relativeURL)
        
        do {
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
        let fileURL = localFileURL(forRelativePath: relativePath)
        
        do {
            // Read image data from the local file
            let imageData = try Data(contentsOf: fileURL)
            return imageData
        } catch {
            print("Error loading image data:", error.localizedDescription)
            return nil
        }
    }
    
    func deleteRecipeFromFileManager(relativePath: String) {
        let fileURL = localFileURL(forRelativePath: relativePath)
        
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("Image deleted from file manager:", fileURL)
        } catch {
            print("Error deleting image from file manager:", error.localizedDescription)
        }
    }
}
