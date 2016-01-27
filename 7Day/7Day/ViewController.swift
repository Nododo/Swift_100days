//
//  ViewController.swift
//  7Day
//
//  Created by 杜维欣 on 16/1/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextView.becomeFirstResponder()
        self.createLeftNavigationItem()
        self.createSwipeGes()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createLeftNavigationItem() {
        let leftBtn = UIButton(frame: CGRectMake(0, 0, 25, 25))
        leftBtn.setBackgroundImage(UIImage(named: "navigation_back_button"), forState: .Normal)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    func createSwipeGes() {
        let swipeGes = UISwipeGestureRecognizer.init(target: self, action: Selector ("swipeToResign"))
        swipeGes.direction = .Down
        view .addGestureRecognizer(swipeGes)
    }
    
    func swipeToResign() {
        topTextView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

