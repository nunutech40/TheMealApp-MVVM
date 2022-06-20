//
//  UIView+LoadNib.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import Foundation
import UIKit

extension UIView {

    /// Loads passed `nibClass` from UINib in corresponding bundle with passed `owner`. Will only work for Nib files that named similar to the class name.
    @discardableResult
    static func loadFromNib(nibClass: NSObject.Type, owner: NSObject?) -> UIView? {

        let nibName = String(describing: nibClass).components(separatedBy: ".").last

        guard let validName = nibName else {
            return nil
        }

        let bundle = Bundle.init(for: nibClass)
        let nibs = bundle.loadNibNamed(
            validName,
            owner: owner,
            options: nil
        )

        return nibs?.last as? UIView
    }
}
