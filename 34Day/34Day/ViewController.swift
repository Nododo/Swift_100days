//
//  ViewController.swift
//  34Day
//
//  Created by 杜维欣 on 16/4/13.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var speakButton: UIButton!

    @IBOutlet weak var logoY: NSLayoutConstraint!
    
    @IBOutlet weak var textFieldH: NSLayoutConstraint!
    
    @IBOutlet weak var bannerH: NSLayoutConstraint!
    
    @IBOutlet weak var voiceW: NSLayoutConstraint!
    
    @IBOutlet weak var topH: NSLayoutConstraint!
    
    override func viewDidAppear(animated: Bool) {

       let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.removeCover()
        logoY.constant = 40
        bannerH.constant = 66
        voiceW.constant = 50
        textFieldH.constant = 40
        topH.constant = 44
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.view.layoutIfNeeded()
            }) { (true) in
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldH.constant = 0
        bannerH.constant = 0
        voiceW.constant = 0
        topH.constant = 0
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PingTransition()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PingInvertTransition()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let speakVC = segue.destinationViewController as! SpeakController
        speakVC.transitioningDelegate = self
    }


}

