//
//  Injection.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 14/4/22.
//

import Foundation

final class Injection: NSObject {
    
    private func provideRepository() -> MealRepositoryProtocol {
        let remote: MealRemoteDataSource = MealRemoteDataSource.sharedInstance
        return MealRepository.sharedInstance(remote)
    }
    
    func provideMealCategory() -> CategoryUseCase {
        let repository = provideRepository()
        return CategoryUseCase(repository: repository)
    }
    
    func provideListMealUseCase() -> ListMealsUseCase {
        let repository = provideRepository()
        return ListMealsUseCase(repository: repository)
    }
    
    func provideMealUseCase() -> MealUseCase {
        let repository = provideRepository()
        return MealUseCase(repository: repository)
    }
}
