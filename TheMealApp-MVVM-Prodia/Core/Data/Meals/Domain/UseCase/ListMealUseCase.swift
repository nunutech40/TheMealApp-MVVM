//
//  MealUseCase.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import Foundation
import RxSwift

struct ListMealsUseCase: UseCase {
    
    let repository: MealRepositoryProtocol
    
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with category: String) -> Observable<[MealsModel]> {
        repository.getListMeals(category: category)
    }
    
}
