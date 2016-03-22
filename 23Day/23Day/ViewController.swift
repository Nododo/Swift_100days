//
//  ViewController.swift
//  23Day
//
//  Created by dwx on 16/3/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let naVC = segue.destinationViewController as! UINavigationController
        let dateVC = naVC.viewControllers.first as! SetDateController
        dateVC.newDate = {resultStr in
        self.dateLabel.text = resultStr
        }
        
    }

}

