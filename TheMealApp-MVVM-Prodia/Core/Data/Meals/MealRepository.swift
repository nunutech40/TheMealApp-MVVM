//
//  CategoryRepository.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 11/4/22.
//

import Foundation
import RxSwift

protocol MealRepositoryProtocol {
    
    func getCategoryMeal() -> Observable<[MealCategoryModel]>
    func getListMeals(category: String) -> Observable<[MealsModel]>
    func getDetailMeal(by id: String) -> Observable<MealModel>
    
}

final class MealRepository: NSObject {
    
    typealias MealInstance = (MealRemoteDataSource) -> MealRepository
    
    fileprivate let remote: MealRemoteDataSource
    
    private init(remote: MealRemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MealInstance = { remoteRepo in
        return MealRepository(remote: remoteRepo)
    }
}

extension MealRepository: MealRepositoryProtocol {
   
    func getCategoryMeal() -> Observable<[MealCategoryModel]> {
        return self.remote.getCategory()
            .map {
                MealMapper.mapCategoryResponseToModel(input: $0)
            }
    }
    
    func getListMeals(category: String) -> Observable<[MealsModel]> {
        return self.remote.getListMeals(category: category)
            .map {
                MealMapper.mapListMealResponseToModel(input: $0)
            }
        
    }
    
    func getDetailMeal(by idMeal: String) -> Observable<MealModel> {
        return self.remote.getDetailMeal(id: idMeal)
            .map {
                MealMapper.mapMealResponsesToModel(by: idMeal, input: $0)
            }
        
    }
    
}

