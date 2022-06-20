//
//  CategoryCell.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 10/4/22.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var imageCategoryMeal: UIImageView!
    @IBOutlet weak var lblCategoryMeal: UILabel!
    @IBOutlet weak var lblCategoryDesc: UILabel!
    
    private var viewModel: CategoryCellViewModel?
    
    var onItemTapped: ((CategoryCellViewModel) -> Void)?
    
    // MARK: - Public Methods
    
    func configureCell(with viewModel: CategoryCellViewModel) {
        self.viewModel = viewModel
        imageCategoryMeal.layer.cornerRadius = 8
        self.lblCategoryDesc.text = viewModel.data?.description ?? ""
        self.lblCategoryMeal.text = viewModel.data?.title ?? ""
        loadImage(from: viewModel.data?.image)
    }
    
    // MARK: - Private Methods
    private func loadImage(from url: String?) {
        guard let urlString = url, let urlIcon = URL(string: urlString) else {
            return
        }
        imageCategoryMeal.kf.setImage(with: urlIcon, placeholder: UIImage(named: "splashApple"))
    }
    
}
