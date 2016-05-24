//
//  CustomTransition.swift
//  37Day
//
//  Created by 杜维欣 on 16/5/20.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

enum UINavigationControllerState {
    case Push;
    case Pop
}

let screenW = UIScreen.mainScreen().bounds.size.width
let screenH = UIScreen.mainScreen().bounds.size.height

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var state: UINavigationControllerState!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if self.state == .Push {
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! CustomController
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailController
            let containerView = transitionContext.containerView()
            let snapView = fromVC.selectedCell.snapshotViewAfterScreenUpdates(false)
            let snapFrame = containerView?.convertRect(fromVC.selectedCell.iconView.frame, fromView: fromVC.selectedCell)
            snapView.frame = snapFrame!
            toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
            toVC.view.alpha = 0
            fromVC.selectedCell.hidden = true
            containerView?.addSubview(toVC.view)
            containerView?.addSubview(snapView)
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveEaseInOut, animations: {
                //这里不知道用storyboard设置的约束 在动画开始的时候是 0 0 600 600 而动画结束后  约束是正确的  如果你知道原因  请告诉我  多谢
                snapView.frame = CGRectMake(0, (screenH - screenW) / 2, screenW, screenW)
                toVC.view.alpha = 1
                }, completion: { (true) in
                    fromVC.selectedCell.hidden = false
                    toVC.bigPhoto.image = fromVC.selectedCell.iconView.image
                    transitionContext.completeTransition(true)
            })
        } else {
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! DetailController
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! CustomController
            let containerView = transitionContext.containerView()
            let snapeView = fromVC.bigPhoto.snapshotViewAfterScreenUpdates(false)
            let snapeFrame = containerView?.convertRect(fromVC.bigPhoto.frame, fromView: fromVC.view)
            snapeView.frame = snapeFrame!
            toVC.view.alpha = 0
            containerView?.addSubview(toVC.view)
            containerView?.addSubview(snapeView)
            let finalFrame = containerView?.convertRect(toVC.selectedCell.iconView.frame, fromView: toVC.selectedCell)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveEaseInOut, animations: {
                snapeView.frame = finalFrame!
                toVC.view.alpha = 1
                }, completion: { (true) in
                    snapeView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
        }
    }
}


