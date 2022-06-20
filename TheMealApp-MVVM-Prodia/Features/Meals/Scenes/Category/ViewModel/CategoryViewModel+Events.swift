//
//  CategoryViewModel+Events.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import Foundation

extension CategoryViewModel {
    
    enum Event: ViewModelEvent {
        case viewDidload
        case retryButtonTapped
        case pulledToRefresh
        case onCategoryTapped(CategoryCellViewModel)
    }
    
}
