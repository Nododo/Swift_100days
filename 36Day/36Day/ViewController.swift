//
//  ViewController.swift
//  36Day
//
//  Created by 杜维欣 on 16/4/18.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

// MARK: 在这里可以学到更多的东西 https://github.com/callumboddy/CBZSplashView

class ViewController: UIViewController {

    var iconView: UIImageView!
    var animationStop = false
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .None);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.coverView)
        self.doAnimation()
    }

    func doAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        animation.values = [1, 0.9, 15]
        animation.keyTimes = [0, 0.4, 1]
        animation.duration = 1;
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)]
        self.iconView.layer.addAnimation(animation, forKey: "scale")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.coverView.removeFromSuperview()
        self.animationStop = true
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade);
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    lazy var coverView: UIView = {
        var tempView: UIView = UIView.init(frame: self.view.bounds)
        tempView.backgroundColor = UIColor.init(red: 93 / 255.0, green: 173 / 255.0, blue: 244 / 255.0, alpha: 1)
        let iconView = UIImageView.init(image: UIImage(named: "twitterIcon"))
        iconView.bounds.size = CGSizeMake(62, 50)
        iconView.center = tempView.center
        tempView.addSubview(iconView)
        self.iconView = iconView
        return tempView
    }()
}

