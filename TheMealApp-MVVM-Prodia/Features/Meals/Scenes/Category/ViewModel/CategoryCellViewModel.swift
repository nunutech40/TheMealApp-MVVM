//
//  CategoryCellViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import Foundation

struct CategoryCellViewModel {
    
    let data: MealCategoryModel?
    let onDidClickTapped: ((_ data: MealCategoryModel) -> Void)?
    
}
