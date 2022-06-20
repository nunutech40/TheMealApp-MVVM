//
//  UseCase.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 14/4/22.
//

import Foundation
import RxSwift

protocol UseCase {

    associatedtype Result
    associatedtype Parameters

    func execute(with parameters: Parameters) -> Observable<Result>
}

struct AnyUseCase<Result, Parameters>: UseCase {

    private let execution: (Parameters) -> Observable<Result>

    init<WrappedUseCase: UseCase>(
        _ wrappedUseCase: WrappedUseCase
    ) where WrappedUseCase.Result == Result, WrappedUseCase.Parameters == Parameters {
        self.execution = wrappedUseCase.execute(with:)
    }

    func execute(with parameters: Parameters) -> Observable<Result> {
        execution(parameters)
    }
}
