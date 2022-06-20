//
//  Observable+FilterNils.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 8/4/22.
//

import Foundation
import RxSwift

extension ObservableType where Element: OptionalType {
    
    /**
     Unwraps and filter out 'nil' elements
     - returns: `Observable` of source `Observable`'s elements, with `nil` elements filtered out.
    */
    
    func filterNil() -> Observable<Element.Wrapped> {
        return self.flatMapLatest { element -> Observable<Element.Wrapped> in
            guard let value = element.optionalValue else {
                return Observable<Element.Wrapped>.empty()
            }
            
            return Observable<Element.Wrapped>.just(value)
        }
    }
}
