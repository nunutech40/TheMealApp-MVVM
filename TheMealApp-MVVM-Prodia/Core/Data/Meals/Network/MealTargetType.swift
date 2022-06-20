//
//  MealsTargetType.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 11/4/22.
//

import Foundation
import RxSwift
import Moya

// prodia version
enum MealTargetType {
    case categories
    case meals
    case meal
    case search
}

extension MealTargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/") else {
            return NSURL() as URL
        }
        return url
    }
    
    var path: String {
        switch self {
        case .categories:
            return "\(baseURL)categories.php"
        case .meals:
            return "\(baseURL)filter.php?c="
        case .meal:
            return "\(baseURL)lookup.php?i="
        case .search:
            return "\(baseURL)search.php?s="
        }
    }
    
    
    var method: Moya.Method {
        
        switch self {
        case .categories,
                .meals,
                .meal,
                .search:
            return .get
        }
    }
    
}
