//
//  LazyImageIntent.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

class LazyImageIntent: ObservableObject {
    @Published var image: UIImage?
    
    func loadImages(url: URL) {
        // Check if the Recipe is already in the cache
        if let imageData = CacheManager.sharedInstance.getImageData(forKey: url.absoluteString) {
            print("Loading from cache")
            self.image = UIImage(data: imageData)
        } else {
            NetworkManager.sharedInstance.downloadImage(from: url) { [weak self] imageData in
                guard let self = self, let imageData = imageData else {
                    return
                }
                DispatchQueue.main.async {
                    // Save the downloaded image to the cache
                    CacheManager.sharedInstance.setImageData(imageData, forKey: url.absoluteString)
                    print("Downloading...")
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
