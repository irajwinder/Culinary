//
//  Validation.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import SwiftUI

struct Validation {
    static func isValidName(_ name: String?) -> Bool {
        guard let name = name, !name.isEmpty else {
            return false
        }
        return true
    }
    
    static func isValidNumber(_ number: String?) -> Bool {
        guard let numberString = number, let intValue = Int(numberString) else {
            return false
        }
        return intValue >= 10 && intValue <= 100
    }
    
    static func showAlert(title: String, message: String) -> Alert {
        return Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
    }
}
