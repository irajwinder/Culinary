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
    
    func searchRecipes(query: String, completion: @escaping (RecipeResponse?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/complexSearch?query=\(query)"
        
        // 1. Get the url
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // 2. Get the URLRequest
        var urlRequest = URLRequest(url: requestURL)
        // Sets cache policy and timeout interval for the request
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30.0
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = APIConstants.headers
        
        //3. Make API request
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let recipeResponse = APIManager.sharedInstance.decodeRecipeResponse(data: data)
            completion(recipeResponse)
        }
        task.resume()
    }
    
    func filterRecipesByNutrients(minCarbs: Int, maxCarbs: Int, completion: @escaping ([Nutrient]?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/findByNutrients?minCarbs=\(minCarbs)&maxCarbs=\(maxCarbs)"
        
        // 1. Get the url
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // 2. Get the URLRequest
        var urlRequest = URLRequest(url: requestURL)
        // Sets cache policy and timeout interval for the request
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30.0
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = APIConstants.headers
        
        //3. Make API request
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let nutrientResponse = APIManager.sharedInstance.decodeNutrientResponse(data: data)
            completion(nutrientResponse)
        }
        task.resume()
    }
    
    func filterRecipesByIngredients(query: String, completion: @escaping ([Ingredient]?) -> Void) {
        let apiUrl = "\(APIConstants.baseRecipeURL)/findByIngredients?ingredients=\(query)"
        
        // 1. Get the url
        guard let requestURL = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        // 2. Get the URLRequest
        var urlRequest = URLRequest(url: requestURL)
        // Sets cache policy and timeout interval for the request
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30.0
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = APIConstants.headers
        
        //3. Make API request
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let ingredientResponse = APIManager.sharedInstance.decodeIngredientResponse(data: data)
            completion(ingredientResponse)
        }
        task.resume()
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
