//
//  CustomLayout.swift
//  37Day
//
//  Created by 杜维欣 on 16/5/20.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    let screenW = UIScreen.mainScreen().bounds.size.width
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        itemSize = CGSizeMake(screenW / 2 - 0.5, screenW / 2)
        minimumLineSpacing = 1
        minimumInteritemSpacing = 0
    }
}
