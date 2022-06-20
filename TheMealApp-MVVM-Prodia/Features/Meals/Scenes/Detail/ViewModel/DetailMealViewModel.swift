//
//  DetailMealViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailMealViewModel {
    
    private let mealUseCase : MealUseCase
    let idMeal: String
    
    init(mealUseCase: MealUseCase, idMeal: String) {
        self.mealUseCase = mealUseCase
        self.idMeal = idMeal
       
    }
}
