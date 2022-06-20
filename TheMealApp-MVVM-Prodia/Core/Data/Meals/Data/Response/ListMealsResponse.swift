//
//  ListMealsResponse.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import Foundation

struct MealsResponse: Decodable {
    
    let meals: [ListMealsResponse]
}

struct ListMealsResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case imageMeal = "strMealThumb"
    }
    
    
    let id: String?
    let title: String?
    let imageMeal: String?
}
