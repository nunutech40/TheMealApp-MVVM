//
//  ReusableView.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView {

    static func nib(with bundle: Bundle) -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: bundle)
    }

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {}

extension UITableViewCell: ReusableView {}

extension UITableViewHeaderFooterView: ReusableView {}
