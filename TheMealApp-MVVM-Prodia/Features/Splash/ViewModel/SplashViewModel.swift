//
//  SplashViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 8/4/22.
//

import Foundation
import RxSwift
import RxCocoa

final class SplashViewModel {
    
    private let disposeBag = DisposeBag()
    private let mutableState = BehaviorRelay<State?>(value: nil)
    
}

extension SplashViewModel: ViewModel {
    
    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }
    
    func onReceiveEvents(_ event: Event) {
        
        switch event {
        case .animationCompleted:
            self.mutableState.accept(.showCategoryMealsVC)
        }
    }
}
