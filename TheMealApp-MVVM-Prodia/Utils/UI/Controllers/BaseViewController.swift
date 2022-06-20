//
//  BaseViewController.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 8/4/22.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    init() {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

