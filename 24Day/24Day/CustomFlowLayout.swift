//
//  CustomFlowLayout.swift
//  24Day
//
//  Created by dwx on 16/3/30.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    let cellW = UIScreen.mainScreen().bounds.size.width / 3
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(cellW, cellW)
    }
}
