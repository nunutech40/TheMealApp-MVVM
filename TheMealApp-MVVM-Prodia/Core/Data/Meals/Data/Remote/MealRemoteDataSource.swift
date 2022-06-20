//
//  MealRemoteDataSource.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 11/4/22.
//

import Foundation
import RxSwift
import Alamofire

protocol MealRemoteDataSourceProtocol {
    
    func getCategory() -> Observable<[MealCategories]>
    func getListMeals(category: String) -> Observable<[ListMealsResponse]>
    func getDetailMeal(id: String) -> Observable<MealDataResponse>
}

final class MealRemoteDataSource: NSObject {
    
    private override init() {}
    
    static let sharedInstance: MealRemoteDataSource = MealRemoteDataSource()
    
}

extension MealRemoteDataSource: MealRemoteDataSourceProtocol {
    
    func getCategory() -> Observable<[MealCategories]> {
        
        return Observable<[MealCategories]>.create { observer in
            
            if let url = URL(string: MealTargetType.categories.path) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: CategoryResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.categories)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getListMeals(category: String) -> Observable<[ListMealsResponse]> {
        
        return Observable<[ListMealsResponse]>.create { observer in
            
            if let url = URL(string: MealTargetType.meals.path + category) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MealsResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.meals)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            
            return Disposables.create()
        }
        
    }
    
    func getDetailMeal(id: String) -> Observable<MealDataResponse> {
        
        return Observable<MealDataResponse>.create { observer in
            
            if let url = URL(string: MealTargetType.meal.path + id) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MealResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.meals[0])
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            
            return Disposables.create()
        }
        
    }
    
}
