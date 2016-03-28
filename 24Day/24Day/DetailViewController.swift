//
//  DetailViewController.swift
//  24Day
//
//  Created by dwx on 16/3/28.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var titleName: String = ""
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let label = UILabel.init(frame: CGRectMake(0, 0, 100, 44));
        label.textAlignment = .Center
        label.text = titleName
        label.font = UIFont.systemFontOfSize(20)
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
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
