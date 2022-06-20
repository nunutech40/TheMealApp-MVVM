//
//  LoadingView.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 15/4/22.
//

import UIKit

final class LoadingView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        loadContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        loadContentView()
    }

    // MARK: - Private Methods

    private func loadContentView() {

        UIView.loadFromNib(nibClass: LoadingView.self, owner: self)

        guard let contentView = contentView else {
            return
        }

        contentView.frame = self.bounds
        addSubview(contentView)
        
    }
}
