//
//  ViewModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 8/4/22.
//

import Foundation
import RxSwift

protocol ViewModel: class {
    
    associatedtype State: ViewModelState
    associatedtype Event: ViewModelEvent
    
    var state: Observable<State> { get }
    
    func onReceiveEvents(_ event: Event)
    
}

protocol ViewModelState {
    
}

protocol ViewModelEvent {
    
}

final class AnyViewModel<State: ViewModelState, Event: ViewModelEvent>: ViewModel {
    
    let state: Observable<State>
    
    private let eventHandler: (Event) -> Void
    
    init<WrappedViewModel: ViewModel>(
        _ wrappedViewModel: WrappedViewModel
    ) where WrappedViewModel.State == State, WrappedViewModel.Event == Event {
        self.state = wrappedViewModel.state
        self.eventHandler = wrappedViewModel.onReceiveEvents
    }
    
    func onReceiveEvents(_ event: Event) {
        eventHandler(event)
    }
    
}
