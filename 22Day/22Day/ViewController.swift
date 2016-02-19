//
//  ViewController.swift
//  22Day
//
//  Created by 杜维欣 on 16/2/19.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func setDate(sender: UIButton) {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        let str = formatter.stringFromDate(self.datePicker.date);
        self.title = str
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Date"
        self.datePicker.datePickerMode = .Date
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

