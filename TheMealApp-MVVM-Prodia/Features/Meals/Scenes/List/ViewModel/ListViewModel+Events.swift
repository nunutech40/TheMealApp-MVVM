//
//  ListViewModel+Events.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import Foundation

extension ListMealViewModel {
    
    enum Event: ViewModelEvent {
        case viewDidload
        case otherMealTapped(OhterListMealCellViewModel)
    }
    
}
