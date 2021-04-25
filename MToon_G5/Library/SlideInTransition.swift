//
//  SlideInTransition.swift
//  MToon_G5
//
//  Created by Computer on 4/23/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    var dimmingView = UIView()
    var finalToView: UIViewController?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to), let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        finalToView = toViewController
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.85
        
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            containerView.addSubview(toViewController.view)
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        
        let view = UIView()
        view.frame = CGRect(x: finalWidth, y: 0, width: containerView.bounds.width * 0.15, height: finalHeight)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCloseMenu))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        containerView.addSubview(view)
        
        
        let transform = {
            self.dimmingView.alpha = 0.4
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        let indentify = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: { self.isPresenting ? transform() : indentify() }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    
    @objc func tapCloseMenu() {
        finalToView?.dismiss(animated: true, completion: nil)
    }
}
