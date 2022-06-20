//
//  UICollectionView+Ext.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {

        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }

    public func register<T: UICollectionViewCell>(_ collectionViewCell: T.Type, with bundle: Bundle = .main) {
        register(T.nib(with: bundle), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}
