//
//  CategoryUseCase.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 14/4/22.
//

import Foundation
import RxSwift

struct CategoryUseCase: UseCase {
    
    let repository: MealRepositoryProtocol
    
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with parameter: Void) -> Observable<[MealCategoryModel]> {
        repository.getCategoryMeal()
    }
    
}
