//
//  APIManager.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

class APIManager: NSObject {
    static let sharedInstance: APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    // Generic function to decode different types of responses
    func decodeResponse<T: Decodable>(data: Data, responseType: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(responseType, from: data)
            return decodedResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
