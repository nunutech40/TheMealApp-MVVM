//
//  MealUseCase.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import Foundation
import RxSwift

struct MealUseCase: UseCase {
    
    let repository: MealRepositoryProtocol
    
    init(repository: MealRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with idMeal: String) -> Observable<MealModel> {
        repository.getDetailMeal(by: idMeal)
    }
    
}
