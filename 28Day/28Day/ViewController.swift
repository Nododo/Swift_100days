//
//  ViewController.swift
//  28Day
//
//  Created by dwx on 16/4/3.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat.random()
        let g = CGFloat.random()
        let b = CGFloat.random()
        return UIColor.init(red: r, green: g, blue: b, alpha: 1)
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var bannerView: UICollectionView!
    var timer: NSTimer!
    var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false//防止 scrollView 自动调整
        self.setupTimer()

    }
    
    func setupTimer() {
        self.timer = NSTimer.init(timeInterval: 1.0, target: self, selector: #selector(ViewController.automaticScroll), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
    }
    
    func automaticScroll() {//自动滚动
     self.index += 1
        if self.index > 8 {
            self.index = 0
            self.bannerView .scrollToItemAtIndexPath(NSIndexPath.init(forItem: self.index, inSection: 0), atScrollPosition: .Left, animated: false)
        } else {
            
            self.bannerView .scrollToItemAtIndexPath(NSIndexPath.init(forItem: self.index, inSection: 0), atScrollPosition: .Left, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("custom", forIndexPath: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.index = Int(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.size.width)
        self.setupTimer()
    }

}

