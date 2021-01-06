//
//  SliderInTransition.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/28/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class SliderInTransition: NSObject,  UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dinmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        let containerView = transitionContext.containerView
        let finalWith = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            dinmingView.backgroundColor = .black
            dinmingView.alpha = 0.0
            containerView.addSubview(dinmingView)
            dinmingView.frame = containerView.bounds
            
            containerView.addSubview(toViewController.view)
            
            toViewController.view.frame = CGRect(x: -finalWith, y: 0, width: finalWith, height: finalHeight)
        }
        // Animation in screen
        let transform = {
            self.dinmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWith, y: 0) }
        
        let identity = {
            self.dinmingView.alpha = 0.0
            fromViewController.view.transform = .identity }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) {(_) in transitionContext.completeTransition(!isCancelled)}
    }
    

    
}
