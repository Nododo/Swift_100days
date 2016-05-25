//
//  DetailController.swift
//  37Day
//
//  Created by 杜维欣 on 16/5/20.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class DetailController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var bigPhoto: UIImageView!
    
    private var percentDrivenTransition: UIPercentDrivenInteractiveTransition?

    override func viewWillAppear(animated: Bool) {
         self.navigationController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(panTheEdge))
        edgeGesture.edges = .Left
        view.addGestureRecognizer(edgeGesture)
    }
    
    func panTheEdge(gesture: UIScreenEdgePanGestureRecognizer) {
        let percentage = gesture.translationInView(self.view).x / self.view.bounds.width
        if gesture.state == .Began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewControllerAnimated(true)
        } else if gesture.state == .Changed {
            self.percentDrivenTransition?.updateInteractiveTransition(percentage)
        } else if gesture.state == .Ended || gesture.state == .Cancelled {
            if percentage > 0.5 {
                self.percentDrivenTransition?.finishInteractiveTransition()
            } else {
                self.percentDrivenTransition?.cancelInteractiveTransition()
            }
            self.percentDrivenTransition = nil
        }
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Pop {
            let ct = CustomTransition()
            ct.state = .Pop
            return ct
        } else {
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is CustomTransition {
            return self.percentDrivenTransition
        } else {
            return nil
        }
    }
}
