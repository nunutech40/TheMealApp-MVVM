//
//  ListViewModel+State.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import Foundation

extension ListMealViewModel {
    
    enum State: ViewModelState {
        case showLoading(Bool)
        case showError(Bool)
        case dataUpdated([Section])
        case showDetailMeal(String)
    }
    
}
