//
//  ViewController.swift
//  ZeroDay
//
//  Created by 杜维欣 on 16/1/25.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!

    @IBAction func tapToChange(sender: AnyObject) {
        if let numText = numLabel.text {
            if let number = Int(numText) {
                self.numLabel.text = "\(number + 1)"
            } else {
                self.numLabel.text = "0"
            }
        }
    }
    @IBAction func reste(sender: AnyObject) {
        self.numLabel.text = "0"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Counter"
    }


}

