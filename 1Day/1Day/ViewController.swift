//
//  ViewController.swift
//  1Day
//
//  Created by 杜维欣 on 16/1/25.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!

    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .Changed {
            if let tempNum = Int(self.numLabel.text!) {
                self.numLabel.text = "\(tempNum + 1)"
            }
        }
    }
    @IBAction func tapToChange(sender: AnyObject) {
        if let tempNum = Int(self.numLabel.text!) {
            self.numLabel.text = "\(tempNum + 1)"
        }
    }
    @IBOutlet weak var reste: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Counter"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

