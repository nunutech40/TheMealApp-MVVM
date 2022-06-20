//
//  ListViewModel+Section.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import UIKit

extension ListMealViewModel {
    
    enum Section {
        case title(String)
        case imageMeal(String)
        case listMeals(String, [OhterListMealCellViewModel])
        case description(String)
        
        var numberOfItems: Int {
            switch self {
            case .title, .imageMeal, .listMeals, .description:
                return 1
            }
        }
        
    }
    
}
