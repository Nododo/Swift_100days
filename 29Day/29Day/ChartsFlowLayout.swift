
//
//  ChartsFlowLayout.swift
//  29Day
//
//  Created by dwx on 16/4/5.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ChartsFlowLayout: UICollectionViewFlowLayout {
    let screenW = UIScreen.mainScreen().bounds.size.width
    let itemH: CGFloat = 88
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(screenW, itemH)
    }
    
    override init() {
        super.init()
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(screenW, itemH)
    }
}
