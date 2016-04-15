//
//  PingTransition.swift
//  34Day
//
//  Created by 杜维欣 on 16/4/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class PingTransition: NSObject, UIViewControllerAnimatedTransitioning{

    var transitionContext: UIViewControllerContextTransitioning!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let viewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SpeakController
        
        let contentView = transitionContext.containerView()
        
        let  speakBtn = viewController.speakButton;
        
        contentView?.addSubview(toVC.view)
        
        let maskStartBP = UIBezierPath.init(ovalInRect: speakBtn.frame)
        
        let  finalPoint = CGPointMake(speakBtn.center.x - 0, speakBtn.center.y - CGRectGetMaxY(toVC.view.bounds));
        
        let radius = sqrt((finalPoint.x * finalPoint.x) + (finalPoint.y * finalPoint.y));
        
        let maskFinalBP = UIBezierPath.init(ovalInRect: CGRectInset(speakBtn.frame, -radius, -radius))

        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskFinalBP.CGPath;
        toVC.view.layer.mask = maskLayer;
        
        let maskLayerAnimation = CABasicAnimation.init(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.CGPath
        maskLayerAnimation.toValue = maskFinalBP.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self;
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext.completeTransition(!self.transitionContext.transitionWasCancelled())
        self.transitionContext.viewControllerForKey("UITransitionContextFromViewControllerKey")?.view.layer.mask = nil
        self.transitionContext.viewControllerForKey("UITransitionContextToViewControllerKey")?.view.layer.mask = nil
    }
}
