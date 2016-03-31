//
//  MainController.swift
//  24Day
//
//  Created by dwx on 16/3/30.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "custom"

class MainController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo"

        
// MARK: 创建UICollectionViewController 这里自动帮你注册cell
// MARK: 但是如果用storyboard 就没必要注册  如果注册  走的就是代码中的方法 而非storyboard中的布局
// MARK:   self.collectionView!.registerClass(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(20) + 1);
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCell
    
        let photoStr = String(format: "%d", arc4random_uniform(9) + 1)
        cell.photoView.image = UIImage(named: photoStr)
        cell.photoName = photoStr
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detail = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("detail") as! DetailController
        self.navigationController?.pushViewController(detail, animated: true)
    }

}
