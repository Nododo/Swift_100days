//
//  HeaderFlowLayout.swift
//  29Day
//
//  Created by 杜维欣 on 16/4/5.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class HeaderFlowLayout: UICollectionViewFlowLayout {

    let screenW = UIScreen.mainScreen().bounds.size.width
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(screenW, 100)
        self.scrollDirection = .Horizontal
    }
}
