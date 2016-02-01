//
//  DetailViewController.swift
//  15Day
//
//  Created by 杜维欣 on 16/1/29.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    
    var detailPerson: Person! = Person()
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Info Card"
        self.nameLabel.text = detailPerson?.name
        self.iconView.image = UIImage(named: (detailPerson?.icon)!)
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
