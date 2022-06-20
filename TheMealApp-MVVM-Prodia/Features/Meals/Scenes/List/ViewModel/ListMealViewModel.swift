//
//  ListMealViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import Foundation
import RxSwift
import RxCocoa

final class ListMealViewModel {
    
    private let mutableState = BehaviorRelay<State?>(value: nil)
    private let disposeBag = DisposeBag()
    private let listMealsUseCase : ListMealsUseCase
    private let dataMeal: MealCategoryModel
    
    private var items = [OhterListMealCellViewModel]()
    
    init(listMealUseCase: ListMealsUseCase, dataMeal: MealCategoryModel) {
        self.listMealsUseCase = listMealUseCase
        self.dataMeal = dataMeal
    }
    
    private func fetchDataDetail(_ dataMeal: MealCategoryModel) {
        self.retreiveListMeals(category: dataMeal.title)
    }
    
    private func retreiveListMeals(category: String) {
        
        mutableState.accept(.showLoading(true))
        mutableState.accept(.showError(false))
        
        self.listMealsUseCase.execute(with: (category))
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] (response: [MealsModel]?) in
                    self?.mutableState.accept(.showLoading(false))
                    self?.mutableState.accept(.showError(false))
                    self?.items = []
                    guard let meals = response else {
                        return
                    }
                    for mealData in meals {
                        let item = OhterListMealCellViewModel(
                            data: mealData,
                            onDidClickTapped: { meal in
                                print("cek meal: \(meal)")
                            })
                            self?.items.append(item)
                    }
                    self?.configureDisplayData()
                },
                onError: { [weak self] error in
                    self?.mutableState.accept(.showError(true))
                    self?.mutableState.accept(.showLoading(false))
                },
                onCompleted: {
                    self.mutableState.accept(.showLoading(false))
                    self.mutableState.accept(.showError(false))
                }
            )
            .disposed(by: disposeBag)
        
    }
    
    private func configureDisplayData() {
        var sections = [Section]()
        sections.append(.title(self.dataMeal.title))
        sections.append(.imageMeal(self.dataMeal.image))
        sections.append(.listMeals(self.dataMeal.title, self.items))
        sections.append(.description(self.dataMeal.description))
        
        mutableState.accept(.dataUpdated(sections))
    }
    
    private func onSelectedMeal(by idMeal: String) {
        self.mutableState.accept(.showDetailMeal(idMeal))
    }
}

extension ListMealViewModel: ViewModel {
    
    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }
    
    func onReceiveEvents(_ event: Event) {
        switch event {
        case .viewDidload:
            self.fetchDataDetail(self.dataMeal)
        case .otherMealTapped(let viewModel):
            self.onSelectedMeal(by: viewModel.data?.id ?? "0")
        }
    }
}

