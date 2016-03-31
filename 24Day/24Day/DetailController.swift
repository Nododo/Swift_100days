

//
//  DetailController.swift
//  24Day
//
//  Created by dwx on 16/3/30.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var avatarView: UIImageView!
    @IBAction func alert(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        avatarView.image = UIImage(named: self.title!)
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
