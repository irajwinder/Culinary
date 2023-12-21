//
//  Recipe.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

struct RecipeResponse: Codable {
    let results: [Recipe]
    let offset: Int
    let number: Int
    let totalResults: Int
}

struct Recipe: Codable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
    //let nutrition: Nutrition
}

struct Nutrition: Codable {
    let nutrients: [NutritionInfo]
}

struct NutritionInfo: Codable {
    let name: String
    let amount: Double
    let unit: String
}

//{
//  "results": [
//    {
//      "id": 1079930,
//      "title": "Crock Pot Pasta Bolognese Sauce",
//      "image": "https://spoonacular.com/recipeImages/1079930-312x231.jpg",
//      "imageType": "jpg",
//      "nutrition": {
//        "nutrients": [
//          {
//            "name": "Calories",
//            "amount": 174.105,
//            "unit": "kcal"
//          },
//          {
//            "name": "Protein",
//            "amount": 17.351,
//            "unit": "g"
//          },
//          {
//            "name": "Fat",
//            "amount": 5.58495,
//            "unit": "g"
//          },
//          {
//            "name": "Carbohydrates",
//            "amount": 11.9648,
//            "unit": "g"
//          },
//          {
//            "name": "Alcohol",
//            "amount": 0,
//            "unit": "g"
//          },
//          {
//            "name": "Caffeine",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Copper",
//            "amount": 0.415894,
//            "unit": "mg"
//          },
//          {
//            "name": "Calcium",
//            "amount": 94.7062,
//            "unit": "mg"
//          },
//          {
//            "name": "Cholesterol",
//            "amount": 41.8467,
//            "unit": "mg"
//          },
//          {
//            "name": "Choline",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Fluoride",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Saturated Fat",
//            "amount": 2.30895,
//            "unit": "g"
//          },
//          {
//            "name": "Vitamin A",
//            "amount": 548.522,
//            "unit": "IU"
//          },
//          {
//            "name": "Vitamin C",
//            "amount": 16.3089,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin D",
//            "amount": 0.189065,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin E",
//            "amount": 2.48981,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin K",
//            "amount": 11.8465,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin B1",
//            "amount": 0.168313,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B2",
//            "amount": 0.348004,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B3",
//            "amount": 6.32077,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B5",
//            "amount": 1.37698,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B6",
//            "amount": 0.529558,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B12",
//            "amount": 1.34097,
//            "unit": "µg"
//          },
//          {
//            "name": "Fiber",
//            "amount": 3.85943,
//            "unit": "g"
//          },
//          {
//            "name": "Folate",
//            "amount": 32.3166,
//            "unit": "µg"
//          },
//          {
//            "name": "Folic Acid",
//            "amount": 0,
//            "unit": "µg"
//          },
//          {
//            "name": "Iron",
//            "amount": 3.83587,
//            "unit": "mg"
//          },
//          {
//            "name": "Magnesium",
//            "amount": 52.4366,
//            "unit": "mg"
//          },
//          {
//            "name": "Manganese",
//            "amount": 0.379435,
//            "unit": "mg"
//          },
//          {
//            "name": "Phosphorus",
//            "amount": 224.386,
//            "unit": "mg"
//          },
//          {
//            "name": "Potassium",
//            "amount": 868.492,
//            "unit": "mg"
//          },
//          {
//            "name": "Selenium",
//            "amount": 14.215,
//            "unit": "µg"
//          },
//          {
//            "name": "Sodium",
//            "amount": 788.536,
//            "unit": "mg"
//          },
//          {
//            "name": "Sugar",
//            "amount": 9.26969,
//            "unit": "g"
//          },
//          {
//            "name": "Zinc",
//            "amount": 3.71029,
//            "unit": "mg"
//          }
//        ]
//      }
//    },
//    {
//      "id": 474589,
//      "title": "Crockpot Turkey Bolognese Pasta Sauce",
//      "image": "https://spoonacular.com/recipeImages/474589-312x231.jpg",
//      "imageType": "jpg",
//      "nutrition": {
//        "nutrients": [
//          {
//            "name": "Calories",
//            "amount": 207.066,
//            "unit": "kcal"
//          },
//          {
//            "name": "Protein",
//            "amount": 20.5302,
//            "unit": "g"
//          },
//          {
//            "name": "Fat",
//            "amount": 6.59255,
//            "unit": "g"
//          },
//          {
//            "name": "Carbohydrates",
//            "amount": 11.6156,
//            "unit": "g"
//          },
//          {
//            "name": "Alcohol",
//            "amount": 2.12,
//            "unit": "g"
//          },
//          {
//            "name": "Caffeine",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Copper",
//            "amount": 0.299887,
//            "unit": "mg"
//          },
//          {
//            "name": "Calcium",
//            "amount": 67.7203,
//            "unit": "mg"
//          },
//          {
//            "name": "Cholesterol",
//            "amount": 41.5793,
//            "unit": "mg"
//          },
//          {
//            "name": "Choline",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Fluoride",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Saturated Fat",
//            "amount": 1.08926,
//            "unit": "g"
//          },
//          {
//            "name": "Vitamin A",
//            "amount": 3743.26,
//            "unit": "IU"
//          },
//          {
//            "name": "Vitamin C",
//            "amount": 15.6694,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin D",
//            "amount": 0.302395,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin E",
//            "amount": 2.40382,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin K",
//            "amount": 19.5482,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin B1",
//            "amount": 0.172384,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B2",
//            "amount": 0.173547,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B3",
//            "amount": 9.13381,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B5",
//            "amount": 1.11959,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B6",
//            "amount": 0.928984,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B12",
//            "amount": 0.385554,
//            "unit": "µg"
//          },
//          {
//            "name": "Fiber",
//            "amount": 3.61605,
//            "unit": "g"
//          },
//          {
//            "name": "Folate",
//            "amount": 34.4846,
//            "unit": "µg"
//          },
//          {
//            "name": "Folic Acid",
//            "amount": 0,
//            "unit": "µg"
//          },
//          {
//            "name": "Iron",
//            "amount": 2.67743,
//            "unit": "mg"
//          },
//          {
//            "name": "Magnesium",
//            "amount": 56.0586,
//            "unit": "mg"
//          },
//          {
//            "name": "Manganese",
//            "amount": 0.373289,
//            "unit": "mg"
//          },
//          {
//            "name": "Phosphorus",
//            "amount": 235.443,
//            "unit": "mg"
//          },
//          {
//            "name": "Potassium",
//            "amount": 733.504,
//            "unit": "mg"
//          },
//          {
//            "name": "Selenium",
//            "amount": 17.836,
//            "unit": "µg"
//          },
//          {
//            "name": "Sodium",
//            "amount": 409.828,
//            "unit": "mg"
//          },
//          {
//            "name": "Sugar",
//            "amount": 8.00018,
//            "unit": "g"
//          },
//          {
//            "name": "Zinc",
//            "amount": 1.82922,
//            "unit": "mg"
//          }
//        ]
//      }
//    },
//    {
//      "id": 543261,
//      "title": "Crock Pot Meaty Pasta Sauce",
//      "image": "https://spoonacular.com/recipeImages/543261-312x231.jpg",
//      "imageType": "jpg",
//      "nutrition": {
//        "nutrients": [
//          {
//            "name": "Calories",
//            "amount": 222.082,
//            "unit": "kcal"
//          },
//          {
//            "name": "Protein",
//            "amount": 20.6132,
//            "unit": "g"
//          },
//          {
//            "name": "Fat",
//            "amount": 6.91609,
//            "unit": "g"
//          },
//          {
//            "name": "Carbohydrates",
//            "amount": 16.3475,
//            "unit": "g"
//          },
//          {
//            "name": "Alcohol",
//            "amount": 0,
//            "unit": "g"
//          },
//          {
//            "name": "Caffeine",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Copper",
//            "amount": 0.491763,
//            "unit": "mg"
//          },
//          {
//            "name": "Calcium",
//            "amount": 120.564,
//            "unit": "mg"
//          },
//          {
//            "name": "Cholesterol",
//            "amount": 46.8712,
//            "unit": "mg"
//          },
//          {
//            "name": "Choline",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Fluoride",
//            "amount": 0,
//            "unit": "mg"
//          },
//          {
//            "name": "Saturated Fat",
//            "amount": 2.16401,
//            "unit": "g"
//          },
//          {
//            "name": "Vitamin A",
//            "amount": 4732.83,
//            "unit": "IU"
//          },
//          {
//            "name": "Vitamin C",
//            "amount": 47.9919,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin D",
//            "amount": 0.0755987,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin E",
//            "amount": 4.08307,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin K",
//            "amount": 27.2461,
//            "unit": "µg"
//          },
//          {
//            "name": "Vitamin B1",
//            "amount": 0.226447,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B2",
//            "amount": 0.279547,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B3",
//            "amount": 7.30806,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B5",
//            "amount": 1.2229,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B6",
//            "amount": 0.750133,
//            "unit": "mg"
//          },
//          {
//            "name": "Vitamin B12",
//            "amount": 1.69341,
//            "unit": "µg"
//          },
//          {
//            "name": "Fiber",
//            "amount": 6.21281,
//            "unit": "g"
//          },
//          {
//            "name": "Folate",
//            "amount": 51.9206,
//            "unit": "µg"
//          },
//          {
//            "name": "Folic Acid",
//            "amount": 0,
//            "unit": "µg"
//          },
//          {
//            "name": "Iron",
//            "amount": 5.46861,
//            "unit": "mg"
//          },
//          {
//            "name": "Magnesium",
//            "amount": 71.9753,
//            "unit": "mg"
//          },
//          {
//            "name": "Manganese",
//            "amount": 0.567597,
//            "unit": "mg"
//          },
//          {
//            "name": "Phosphorus",
//            "amount": 242.696,
//            "unit": "mg"
//          },
//          {
//            "name": "Potassium",
//            "amount": 1078.35,
//            "unit": "mg"
//          },
//          {
//            "name": "Selenium",
//            "amount": 15.0333,
//            "unit": "µg"
//          },
//          {
//            "name": "Sodium",
//            "amount": 1154.6,
//            "unit": "mg"
//          },
//          {
//            "name": "Sugar",
//            "amount": 12.3131,
//            "unit": "g"
//          },
//          {
//            "name": "Zinc",
//            "amount": 4.64193,
//            "unit": "mg"
//          }
//        ]
//      }
//    }
//  ],
//  "offset": 0,
//  "number": 10,
//  "totalResults": 3
//}
