//
//  LinaController.swift
//  33Day
//
//  Created by 杜维欣 on 16/4/11.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class LinaController: BaseController {
    @IBAction func upSwipe(sender: UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("linaToQueen", sender: .None)
    }

    @IBAction func downSwipe(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
