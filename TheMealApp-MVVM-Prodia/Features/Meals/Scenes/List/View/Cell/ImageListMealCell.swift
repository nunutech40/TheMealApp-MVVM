//
//  ImageListMealCell.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import UIKit

class ImageListMealCell: UITableViewCell {

    @IBOutlet weak var imageMeal: UIImageView!
    
    func configure(strImage: String) {
        self.loadImage(from: strImage)
    }
    
    private func loadImage(from url: String?) {
        guard let urlString = url, let urlIcon = URL(string: urlString) else {
            return
        }
        imageMeal.kf.setImage(with: urlIcon, placeholder: UIImage(named: "splashApple"))
    }
}
