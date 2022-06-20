//
//  CategoryResponse.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 11/4/22.
//

import Foundation

struct CategoryResponse: Decodable {
    
    let categories: [MealCategories]
    
}

struct MealCategories: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    let id: String?
    let title: String?
    let image: String?
    let description: String?
    
}
