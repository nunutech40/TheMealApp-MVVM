//
//  OtherListMealCell.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 19/4/22.
//

import UIKit

class OtherListMealCell: UITableViewCell {
    
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cellViewModels = [OhterListMealCellViewModel]()
    
    var onItemTapped: ((OhterListMealCellViewModel) -> Void)?
    
    func configure(category: String, cellViewModels: [OhterListMealCellViewModel]) {
        self.titleCategory.text = "Meal From \(category)"
        self.cellViewModels = cellViewModels
        self.setupCollection()
    }
    
    func setupCollection() {
        self.collectionView.register(UINib(nibName: "OtherListMealColl", bundle: nil), forCellWithReuseIdentifier: "OtherListMealColl")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
}

extension OtherListMealCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OtherListMealColl
        cell.configure(cellViewModel: cellViewModel)
        return cell
    }
    
    
}

extension OtherListMealCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = cellViewModels[indexPath.row]
        onItemTapped?(cellViewModel)
    }
}

extension OtherListMealCell: UICollectionViewDelegateFlowLayout {
    
    
    
}
