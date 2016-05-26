//
//  MyTableViewCell.swift
//  39Day
//
//  Created by 杜维欣 on 16/5/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        mainCollectionView?.backgroundColor = UIColor.whiteColor()
//        print(self.subviews)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainCollectionView?.backgroundColor = UIColor.whiteColor()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("nododoC", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.iconView.image = UIImage(named: "1")
//        cell.backgroundColor = UIColor.redColor()
        return cell
    }
}
