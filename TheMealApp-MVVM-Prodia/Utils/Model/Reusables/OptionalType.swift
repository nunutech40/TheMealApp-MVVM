//
//  OptionalType.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import Foundation

protocol OptionalType {

    associatedtype Wrapped

    func map<U>(_ mapper: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

extension OptionalType {

    /**
    Proxy property to allow extensions use Optional normally.
    */
    var optionalValue: Wrapped? {

        return self.map { (value: Wrapped) -> Wrapped in
            return value
        }
    }
}
