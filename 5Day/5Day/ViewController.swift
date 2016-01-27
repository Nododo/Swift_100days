//
//  ViewController.swift
//  5Day
//
//  Created by 杜维欣 on 16/1/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func updateTime(sender: AnyObject) {
        
        self.updateLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateLabel()
    }
    
    func updateLabel() {
        let dateFormatter = NSDateFormatter()
//        dateFormatter.locale = NSLocale.init(localeIdentifier: "zh_CN")
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .MediumStyle
//        dateFormatter.dateFormat = "yyyy-MM-dd a HH:mm:ss"
        dateLabel.text = dateFormatter.stringFromDate(NSDate())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

