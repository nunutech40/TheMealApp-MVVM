//
//  SplashViewController.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 5/4/22.
//

import UIKit

class SplashViewController: BaseViewController {
    
    typealias ViewModel = AnyViewModel<SplashViewModel.State, SplashViewModel.Event>
    
    @IBOutlet weak var logoVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var circularWidthViewConstraint: NSLayoutConstraint!
    
    private let transition = FadedViewControllerTransition(transition: .fadeIn)
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel = AnyViewModel(SplashViewModel())) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        startCircularViewAnimation()
    }
    
    func bindViewModel() {
        viewModel.state
            .subscribe(onNext: { [weak self] (state: SplashViewModel.State) in
                switch state {
                case .showCategoryMealsVC:
                    let categoryUseCase = Injection.init().provideMealCategory()
                    self?.navigateTo(initialScreen: UINavigationController(rootViewController: CategoryViewController(viewModel: CategoryViewModel(categoryListUseCase: categoryUseCase))))
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func navigateTo(initialScreen: UIViewController) {
        initialScreen.transitioningDelegate = self
        initialScreen.modalPresentationStyle = .fullScreen
        present(initialScreen, animated: true)
    }

}

extension SplashViewController: UIViewControllerTransitioningDelegate {

    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        transition
    }
}

extension SplashViewController {
    
    private func startCircularViewAnimation() {

        let circularViewWidth = screenHeight * 2

        logoImage.alpha = 0
        circularWidthViewConstraint.constant = circularViewWidth

        UIView.animate(
            withDuration: 0.7,
            delay: 0.3,
            animations: { [weak self] in

                self?.circularView.layer.cornerRadius = circularViewWidth * 0.5
                self?.view.layoutIfNeeded()
            },
            completion: { [weak self] _ in
                self?.view.backgroundColor = .mainColor
                self?.circularView.isHidden = true
                self?.startLogoAppearingAnimation()
            }
        )
    }

    private func startLogoAppearingAnimation() {

        logoVerticalConstraint.constant = -20

        UIView.animate(
            withDuration: 0.8,
            animations: { [weak self] in

                self?.logoImage.alpha = 1
                self?.view.layoutIfNeeded()
            },
            completion: { [weak self] _ in
                self?.viewModel.onReceiveEvents(.animationCompleted)
            }
        )
    }
    
}
