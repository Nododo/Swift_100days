

//
//  BlurView.swift
//  29Day
//
//  Created by 杜维欣 on 16/4/8.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class BlurView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    var resultArray: [Movie]! = []{
    
        didSet {
            collectionView.reloadData()
        }
    }
    
    var collectionView: UICollectionView!
    
    
  override  init(frame: CGRect) {
        super.init(frame: frame)
        let effect = UIBlurEffect.init(style: .Dark)
        let view = UIVisualEffectView.init(effect: effect)
        view.frame = bounds
        self.addSubview(view)
    
    
    let layout = CustomFlowLayout()
    layout.headerReferenceSize = CGSizeMake(0, 64)
    collectionView = UICollectionView.init(frame: bounds, collectionViewLayout: layout)
//    collectionView.backgroundColor = UIColor.randomColor()
//    collectionView.registerClass(FeaturedCell.self, forCellWithReuseIdentifier: "blur")
    collectionView.registerNib(UINib.init(nibName: "BlurCell", bundle: nil), forCellWithReuseIdentifier: "blur")
    collectionView.backgroundColor = UIColor.clearColor()
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let movie = resultArray[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("blur", forIndexPath: indexPath) as! BlurCell
        cell.photoView.image = UIImage(named: movie.moviePic)
        cell.nameLabel.text = movie.movieName
        return cell
    }

}
