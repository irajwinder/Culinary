//
//  NetworkManager.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

class NetworkManager : NSObject {
    
    static let sharedInstance : NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    private override init() {
        super.init()
        
    }
    
    // Generic function to make API requests
    private func makeAPIRequest<T: Decodable>(url: URL, responseType: T.Type, completion: @escaping (T?) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30.0
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = APIConstants.headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let decodedResponse = APIManager.sharedInstance.decodeResponse(data: data, responseType: responseType)
            completion(decodedResponse)
        }
        task.resume()
    }
    
    //search recipes
    func searchRecipes(query: String, completion: @escaping (RecipeResponse?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/complexSearch?query=\(query)"
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // Make API request with specified response type
        makeAPIRequest(url: requestURL, responseType: RecipeResponse.self, completion: completion)
    }
    
    //filter recipes by nutrients
    func filterRecipesByNutrients(minCarbs: Int, maxCarbs: Int, completion: @escaping ([Nutrient]?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/findByNutrients?minCarbs=\(minCarbs)&maxCarbs=\(maxCarbs)"
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        makeAPIRequest(url: requestURL, responseType: [Nutrient].self, completion: completion)
    }
    
    //filter recipes by ingredients
    func filterRecipesByIngredients(query: String, completion: @escaping ([Ingredient]?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/findByIngredients?ingredients=\(query)"
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        makeAPIRequest(url: requestURL, responseType: [Ingredient].self, completion: completion)
    }
    
    //download images from a given URL
    func downloadImage(from url: URL, completion: @escaping (Data?) -> Void) {
        // Create a data task to download the image from the given URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            // Pass data to the completion block
            completion(data)
        }
        // Resume the data task to start the download
        task.resume()
    }
}
