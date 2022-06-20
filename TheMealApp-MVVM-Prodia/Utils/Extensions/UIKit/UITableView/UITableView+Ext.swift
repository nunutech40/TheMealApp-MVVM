//
//  UITableView+Ext.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {

        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }

    public func register<T: UITableViewCell>(_ tableViewCell: T.Type, with bundle: Bundle = .main) {
        register(T.nib(with: bundle), forCellReuseIdentifier: T.reuseIdentifier)
    }

    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.height = newSize.height
        }
    }

    func updateHeight(animation: Bool = false) {
        UIView.setAnimationsEnabled(animation)
        beginUpdates()
        endUpdates()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadDataWithAutoSizingCellWorkAround() {
        reloadData()
        setNeedsLayout()
        layoutIfNeeded()
        reloadData()
    }
}
