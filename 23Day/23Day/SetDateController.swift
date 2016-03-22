//
//  SetDateController.swift
//  23Day
//
//  Created by dwx on 16/3/22.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class SetDateController: UIViewController {

    var formatter = NSDateFormatter()

    var newDate:(dateStr: String) -> Void = {
        resultResult in
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
        formatter.dateStyle = .MediumStyle
        let dayStr = formatter.stringFromDate(dayPicker.date)
        
        formatter.timeStyle = .ShortStyle
        formatter.dateStyle = .NoStyle
        let timeStr = formatter.stringFromDate(timePicker.date)
       let resultStr = dayStr + " at " + timeStr
        self.newDate(dateStr: resultStr)
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var nowDateLabel: UILabel!
    
    @IBOutlet weak var dayPicker: UIDatePicker!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        formatter.dateStyle = .MediumStyle
        let nowDate = formatter.stringFromDate(NSDate.init())
        nowDateLabel.text = "Today is :" + nowDate
        self.title = "Set Date and Time"
    }

}
