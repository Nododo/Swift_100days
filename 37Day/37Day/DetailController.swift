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


    override func viewWillAppear(animated: Bool) {
         self.navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let ct = CustomTransition()
        ct.state = .Pop
        return ct
    }


}
