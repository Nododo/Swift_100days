//
//  FirstController.swift
//  6Day
//
//  Created by 杜维欣 on 16/1/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class FirstController: UIViewController {

    @IBOutlet weak var firstField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First View"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondC = segue.destinationViewController as! SecondController
        secondC.dataStr = self.firstField.text
    }
    

}
