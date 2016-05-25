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

public let screenW = UIScreen.mainScreen().bounds.size.width
public let screenH = UIScreen.mainScreen().bounds.size.height

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
                    snapView.removeFromSuperview()//昨天加边缘手势一直有问题, 原来是这里的图片没移除, 坑
//                    fromVC.selectedCell.hidden = false 这里可以pop动画的时候再设置显示true
                    toVC.bigPhoto.image = fromVC.selectedCell.iconView.image
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        } else {
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! DetailController
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! CustomController
            let containerView = transitionContext.containerView()
            fromVC.bigPhoto.hidden = true//大图隐藏
            let snapView = fromVC.bigPhoto.snapshotViewAfterScreenUpdates(false)
            let snapFrame = containerView?.convertRect(fromVC.bigPhoto.frame, fromView: fromVC.view)
            snapView.frame = snapFrame!
            toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
            toVC.view.alpha = 0.5
            containerView!.addSubview(toVC.view)
            containerView?.addSubview(snapView)
            let finalFrame = containerView?.convertRect(toVC.selectedCell.iconView.frame, fromView: toVC.selectedCell)
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveEaseInOut, animations: {
                snapView.frame = finalFrame!
                toVC.view.alpha = 1.0
                }, completion: { (true) in
                    toVC.selectedCell.hidden = false//37行 之前隐藏了   现在显示
                    fromVC.bigPhoto.hidden = false
                    snapView.removeFromSuperview()
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        }
    }
}


