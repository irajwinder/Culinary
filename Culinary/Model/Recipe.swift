//
//  Recipe.swift
//  Culinary
//
//  Created by Rajwinder Singh on 12/21/23.
//

import Foundation

struct RecipeResponse: Codable {
    let results: [Recipe]
    let number: Int
    let totalResults: Int
}

struct Recipe: Codable {
    let id: Int
    let title: String
    let image: String
}

//Array Response
struct Nutrition: Codable {
    let id: Int
    let title: String
    let image: String
    let calories: Int
    let protein: String
    let fat: String
    let carbs: String
}

//Array response
struct Ingredient: Codable {
    let id: Int
    let title: String
    let image: String
    let usedIngredientCount: Int
    let missedIngredientCount: Int
}

//{
//    "results": [
//        {
//            "id": 654959,
//            "title": "Pasta With Tuna",
//            "image": "https://spoonacular.com/recipeImages/654959-312x231.jpg",
//            "imageType": "jpg"
//        },
//        {
//            "id": 511728,
//            "title": "Pasta Margherita",
//            "image": "https://spoonacular.com/recipeImages/511728-312x231.jpg",
//            "imageType": "jpg"
//        }
//    ],
//    "offset": 0,
//    "number": 10,
//    "totalResults": 261
//}


//[
//    {
//        "id": 627987,
//        "title": "onion pakoda recipe",
//        "image": "https://spoonacular.com/recipeImages/627987-312x231.jpg",
//        "imageType": "jpg",
//        "calories": 218,
//        "protein": "10g",
//        "fat": "6g",
//        "carbs": "26g"
//    },
//    {
//        "id": 633569,
//        "title": "Baked Crusty Chicken",
//        "image": "https://spoonacular.com/recipeImages/633569-312x231.jpg",
//        "imageType": "jpg",
//        "calories": 367,
//        "protein": "26g",
//        "fat": "24g",
//        "carbs": "10g"
//    }
//]


//[
//  {
//    "id": 641803,
//    "title": "Easy & Delish! ~ Apple Crumble",
//    "image": "https://spoonacular.com/recipeImages/Easy---Delish--Apple-Crumble-641803.jpg",
//    "usedIngredientCount": 3,
//    "missedIngredientCount": 4,
//    "likes": 1
//  },
//  {
//    "id": 645152,
//    "title": "Grandma's Apple Crisp",
//    "image": "https://spoonacular.com/recipeImages/Grandmas-Apple-Crisp-645152.jpg",
//    "usedIngredientCount": 3,
//    "missedIngredientCount": 6,
//    "likes": 1
//  }
//]
