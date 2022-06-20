//
//  OtherListMealCellViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import Foundation

struct OhterListMealCellViewModel {
    
    let data: MealsModel?
    let onDidClickTapped: ((_ data: MealsModel) -> Void)?
    
}
