//
//  FadedViewControllerTransition.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 10/4/22.
//

import UIKit

final class FadedViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {

    private let transition: Transition

    init(transition: Transition) {
        self.transition = transition
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch transition {
        case .fadeOut:
            animateFadeOut(using: transitionContext)

        case .fadeIn:
            animateFadeIn(using: transitionContext)
        }
    }

    func animateFadeIn(using transitionContext: UIViewControllerContextTransitioning) {

        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }

        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0.0

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: { [weak toViewController] in
                toViewController?.view.alpha = 1.0
            },
            completion: { [weak transitionContext] _ in
                transitionContext?.completeTransition(transitionContext?.transitionWasCancelled == false)
            }
        )
    }

    func animateFadeOut(using transitionContext: UIViewControllerContextTransitioning) {

        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
              let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }

        transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: { [weak fromViewController] in
                fromViewController?.view.alpha = 0.0
            },
            completion: { [weak transitionContext] _ in
                transitionContext?.completeTransition(transitionContext?.transitionWasCancelled == false)
            }
        )
    }
}

extension FadedViewControllerTransition {

    enum Transition {
        case fadeIn
        case fadeOut
    }
}
