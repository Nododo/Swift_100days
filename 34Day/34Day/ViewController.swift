//
//  ViewController.swift
//  34Day
//
//  Created by 杜维欣 on 16/4/13.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func doLayerAnimation(sender: UIButton) {
        
    }

    @IBOutlet weak var logoY: NSLayoutConstraint!
    
    @IBOutlet weak var textFieldH: NSLayoutConstraint!
    
    @IBOutlet weak var bannerH: NSLayoutConstraint!
    
    @IBOutlet weak var voiceW: NSLayoutConstraint!
    
    @IBOutlet weak var topH: NSLayoutConstraint!
    
    lazy var coverView: CoverView = {
    let tempView = CoverView(frame: UIScreen.mainScreen().bounds)
        return tempView
    }()
    
    override func viewWillAppear(animated: Bool) {
        self.view.addSubview(coverView)//此处的遮盖图片最好放到appdelegate中的window里面添加
        self.view.bringSubviewToFront(coverView)
    }
    
    override func viewDidAppear(animated: Bool) {
        coverView.removeFromSuperview()
        logoY.constant -= 100
        bannerH.constant = 66
        voiceW.constant = 50
        textFieldH.constant = 40
        topH.constant = 44
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.view.layoutIfNeeded()
            }) { (true) in
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldH.constant = 0
        bannerH.constant = 0
        voiceW.constant = 0
        topH.constant = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

