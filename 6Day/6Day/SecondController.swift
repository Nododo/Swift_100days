//
//  SecondController.swift
//  6Day
//
//  Created by 杜维欣 on 16/1/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var secondField: UITextField!
    /**
     下面的dataStr默认是internal
     一篇关于public internal private的文章  写的很详细
     Swift新特性 -- 访问控制（Access Control）
     http://www.devtalking.com/articles/swift-access-control/
     以上感谢<程序员说>提供的文章
     */
    var dataStr: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second View"
        secondField.text = dataStr
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
