//
//  OtherListMealColl.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import UIKit
import Kingfisher

class OtherListMealColl: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleMeal: UILabel!
    
    private var viewModel: OhterListMealCellViewModel?
    
    func configure(cellViewModel: OhterListMealCellViewModel) {
        self.viewModel = cellViewModel
        guard let data = viewModel?.data else {
            return
        }
        self.setupData(data: data)
    }
    
    func setupData(data: MealsModel) {
        self.titleMeal.text = data.title
        self.loadImage(from: data.imageMeal)
    }
    
    // MARK: - Private Methods
    private func loadImage(from url: String?) {
        guard let urlString = url, let urlIcon = URL(string: urlString) else {
            return
        }
        imageView.kf.setImage(with: urlIcon, placeholder: UIImage(named: "splashApple"))
    }
}
