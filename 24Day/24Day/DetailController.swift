

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
         let reprotAction = UIAlertAction.init(title: "report", style: .Destructive) { (nil) in
           print("report")
        }
        
        let shareAction = UIAlertAction.init(title: "share", style: .Default) { (nil) in
            print("share")
        }
        
        let saveAction = UIAlertAction.init(title: "save image", style: .Default) { (nil) in
            print("save image")
        }
        
        let copyAction = UIAlertAction.init(title: "copy link", style: .Default) { (nil) in
            print("copy link")
        }
        
        let cancleAction = UIAlertAction.init(title: "cancle", style: .Cancel) { (nil) in
            print("cancle")
        }
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .ActionSheet)
        alert.addAction(reprotAction)
        alert.addAction(shareAction)
        alert.addAction(saveAction)
        alert.addAction(copyAction)
        alert.addAction(cancleAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
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
