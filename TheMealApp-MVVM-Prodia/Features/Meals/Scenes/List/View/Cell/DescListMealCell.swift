//
//  DescListMealCell.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import UIKit

class DescListMealCell: UITableViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    
    func configure(desc: String) {
        self.descLabel.text = desc
    }
    
}
