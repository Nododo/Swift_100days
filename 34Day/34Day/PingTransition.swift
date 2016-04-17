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
        
        // MARK: 按钮范围内最大的圆
        let maskStartBP = UIBezierPath.init(ovalInRect: speakBtn.frame)
        
        // MARK: toVC.view外围最大的圆
        let radius = sqrt((toVC.view.frame.size.width * toVC.view.frame.size.width) + (speakBtn.center.y * speakBtn.center.y))

        let maskFinalBP = UIBezierPath.init(arcCenter: speakBtn.center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskFinalBP.CGPath;
        toVC.view.layer.mask = maskLayer;
        
        let maskLayerAnimation = CABasicAnimation.init(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.CGPath
        maskLayerAnimation.toValue = maskFinalBP.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self;
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext)) { 
            var toBtnF = toVC.speakOutBtn.frame
            toBtnF.origin.y = toVC.speakOutBtn.frame.origin.y + 50
            toVC.speakOutBtn.frame = toBtnF
            
            var fromBtnF = speakBtn.frame
            fromBtnF.origin.y = speakBtn.frame.origin.y - 50
            speakBtn.frame = fromBtnF
        } 
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext.completeTransition(!self.transitionContext.transitionWasCancelled())
        self.transitionContext.viewControllerForKey("UITransitionContextFromViewControllerKey")?.view.layer.mask = nil
        self.transitionContext.viewControllerForKey("UITransitionContextToViewControllerKey")?.view.layer.mask = nil
    }
}
