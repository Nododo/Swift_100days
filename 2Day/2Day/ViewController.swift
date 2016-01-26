//
//  ViewController.swift
//  2Day
//
//  Created by 杜维欣 on 16/1/25.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController,ADBannerViewDelegate {

    @IBOutlet weak var adBanner: ADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adBanner.delegate = self
        self.adBanner.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func bannerViewDidLoadAd(banner: ADBannerView!) {
         self.adBanner.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print("fail")
    }
}

