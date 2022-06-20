//
//  CategoryViewModel+State.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import Foundation

extension CategoryViewModel {
    
    enum State: ViewModelState {
        case showLoading(Bool)
        case showError(Bool)
        case showSnacBar(String)
        case itemUpdate([CategoryCellViewModel])
        case showListMeal(CategoryCellViewModel)
    }
    
}
