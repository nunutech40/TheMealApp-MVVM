//
//  TitleListMealCell.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import UIKit

class TitleListMealCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static let preferredHeight: CGFloat = 44
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
    
    static func size(withContainerWidth width: CGFloat) -> CGSize {
        CGSize(width: width, height: preferredHeight)
    }
    
}
