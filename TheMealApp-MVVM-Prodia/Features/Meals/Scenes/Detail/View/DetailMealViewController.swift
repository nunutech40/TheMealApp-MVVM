//
//  DetailMealViewController.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import UIKit
import RxSwift
import RxCocoa

class DetailMealViewController: BaseViewController {
    
    var viewModel: DetailMealViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(viewModel: DetailMealViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
