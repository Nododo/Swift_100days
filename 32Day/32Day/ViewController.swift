//
//  ViewController.swift
//  32Day
//
//  Created by 杜维欣 on 16/4/11.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: 懒加载  初次使用
    lazy var images: [UIImage] = {//动画图片数组
        var tempImages: [UIImage] = []
        for i in 0...23 {
            let image = UIImage(named: String(format: "%d",i))
            if let tempImage = image {
                tempImages.append(tempImage)
            }
        }
        return tempImages
    }()
    
    @IBOutlet weak var animationView: UIImageView!
    
    @IBOutlet weak var spaceToAnimationView: NSLayoutConstraint!//布局约束  没有按作者的来  按autolayout动画来的
    
    @IBAction func startAnimation(sender: UIButton) {//开始动画
        kiteView.hidden = false
       spaceToAnimationView.constant = 300
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
            }) { (true) in
                self.kiteView.hidden = true
               self.spaceToAnimationView.constant = 8
  
        }
        
        animationView.startAnimating()
    }

    
    @IBOutlet weak var kiteView: UIImageView!//小风筝的图片
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.animationImages = images
        animationView.animationDuration = 1
        animationView.image = images[0]
        animationView.animationRepeatCount = 1
        kiteView.image = UIImage(named: "kite.png")
        kiteView.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

