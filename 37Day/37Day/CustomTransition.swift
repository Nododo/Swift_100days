//
//  CustomTransition.swift
//  37Day
//
//  Created by 杜维欣 on 16/5/20.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

struct TransitionStruct {
    var image: UIImage
    var fromFrame: CGRect
    var toFrame: CGRect
    var fromCell: CustomCell
}

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var tStruct: TransitionStruct!
    var tc: AnyObject!
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        tc = transitionContext
        let containerView = transitionContext.containerView()
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        var fromView = fromViewController?.view
        var toView = toViewController?.view
        //        imageView.frame = CGRectOffset(tStruct.fromFrame, 0, 64)
        //        containerView?.addSubview(imageView)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            if self.tStruct.fromCell.frame == self.tStruct.toFrame {
                self.tStruct.fromCell.frame = self.tStruct.toFrame
            } else {
                self.tStruct.fromCell.frame = self.tStruct.fromFrame
            }
        }) { (true) in
            //                imageView.removeFromSuperview()
            containerView?.addSubview(toView!)
            let wasCancelled = transitionContext.transitionWasCancelled()
            transitionContext.completeTransition(!wasCancelled)
        }
        
    }
}
