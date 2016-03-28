//
//  ViewController.swift
//  24Day
//
//  Created by dwx on 16/3/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellW = UIScreen.mainScreen().bounds.size.width / 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel.init(frame: CGRectMake(0, 0, 100, 44));
        label.textAlignment = .Center
        label.text = "Photos"
        label.font = UIFont.systemFontOfSize(20)
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
        
        self.createSubviews()
    }

    func createSubviews() {
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.itemSize = CGSizeMake(cellW, cellW)
        customFlowLayout.minimumInteritemSpacing = 0
        customFlowLayout.minimumLineSpacing = 0
        let customCollectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: customFlowLayout)
        customCollectionView.backgroundColor = UIColor.whiteColor()
        customCollectionView.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "custom")
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        self.view.addSubview(customCollectionView)
        
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(20) + 1);
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCellWithReuseIdentifier("custom", forIndexPath: indexPath) as! CustomCollectionViewCell
        let photoStr = String(format: "%d", arc4random_uniform(9) + 1)
        customCell.photoView.image = UIImage(named: photoStr)
        customCell.photoName = photoStr
        return customCell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailViewController()
        let customCell = collectionView.cellForItemAtIndexPath(indexPath) as! CustomCollectionViewCell
        detailVC.titleName = customCell.photoName
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

