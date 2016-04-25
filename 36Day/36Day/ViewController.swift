//
//  ViewController.swift
//  36Day
//
//  Created by 杜维欣 on 16/4/18.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.coverView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
                                                                              }


    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    lazy var coverView: UIView = {
        var tempView = UIView.init(frame: self.view.bounds)
        tempView.backgroundColor = UIColor.redColor()
        return tempView
    }()
}

