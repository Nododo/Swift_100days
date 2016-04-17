


//
//  PingInvertTransition.swift
//  34Day
//
//  Created by dwx on 16/4/17.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class PingInvertTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var transitionContext: UIViewControllerContextTransitioning!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext

        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SpeakController
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! ViewController
        
        let containerView =  transitionContext.containerView()
        
        containerView?.addSubview(toVC.view)
        containerView?.addSubview(fromVC.view)
        
        let speakOutBtn = fromVC.speakOutBtn
        
        let radius = sqrt((toVC.view.frame.size.width * toVC.view.frame.size.width) + (speakOutBtn.center.y * speakOutBtn.center.y))
        
        let maskStartBP = UIBezierPath.init(arcCenter: speakOutBtn.center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let maskFinalBP = UIBezierPath.init(ovalInRect: toVC.speakButton.frame)
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = maskFinalBP.CGPath
        
        fromVC.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation.init(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.CGPath
        maskLayerAnimation.toValue = maskFinalBP.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self;
        maskLayer.addAnimation(maskLayerAnimation, forKey: "pingInvert")
        
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext)) {
            var fromBtnF = speakOutBtn.frame
            fromBtnF.origin.y = speakOutBtn.frame.origin.y - 50
            speakOutBtn.frame = fromBtnF
            
//            var toBtnF = toVC.speakButton.frame
//            toBtnF.origin.y = toVC.speakButton.frame.origin.y + 200
//            toVC.speakButton.frame = fromBtnF
        }

    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext.completeTransition(!self.transitionContext.transitionWasCancelled())
        self.transitionContext.viewControllerForKey("UITransitionContextFromViewControllerKey")?.view.layer.mask = nil
        self.transitionContext.viewControllerForKey("UITransitionContextToViewControllerKey")?.view.layer.mask = nil
    }

}
