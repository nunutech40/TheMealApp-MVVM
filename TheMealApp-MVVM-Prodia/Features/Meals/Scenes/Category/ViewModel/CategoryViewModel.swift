//
//  CategoryViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 14/4/22.
//

import Foundation
import RxSwift
import RxCocoa

final class CategoryViewModel {
    
    private let mutableState = BehaviorRelay<State?>(value: nil)
    private let disposeBag = DisposeBag()
    private let categoryListUseCase: CategoryUseCase
    
    private var items: [CategoryCellViewModel] = []
    
    init(categoryListUseCase: CategoryUseCase) {
        self.categoryListUseCase = categoryListUseCase
    }
    
    private func retreiveCategory() {
        
        mutableState.accept(.showLoading(true))
        mutableState.accept(.showError(false))
        
        self.categoryListUseCase.execute(with: ())
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] (response: [MealCategoryModel]?) in
                    self?.mutableState.accept(.showLoading(false))
                    self?.mutableState.accept(.showError(false))
                    self?.items = []
                    
                    guard let categoryDatas = response else { return }
                    for categoryData in categoryDatas {
                        let item = CategoryCellViewModel(
                            data: categoryData,
                            onDidClickTapped: { param in
                                
                            })
                            self?.items.append(item)
                    }
                    
                    self?.configureDisplayItem(self?.items ?? [])
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
    
    private func configureDisplayItem(_ items: [CategoryCellViewModel]) {
        self.mutableState.accept(.itemUpdate(items))
    }
}


extension CategoryViewModel: ViewModel {
    
    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }
    
    func onReceiveEvents(_ event: Event) {
        switch event {
        case .viewDidload:
            retreiveCategory()
        case .retryButtonTapped:
            retreiveCategory()
        case .pulledToRefresh:
            retreiveCategory()
        case .onCategoryTapped(let cellViewModel):
            mutableState.accept(.showListMeal(cellViewModel))
        }
    }
}
