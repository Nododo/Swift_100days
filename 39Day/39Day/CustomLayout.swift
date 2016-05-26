//
//  CustomLayout.swift
//  39Day
//
//  Created by 杜维欣 on 16/5/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.itemSize = CGSizeMake(80, 80)
        self.minimumLineSpacing = 20
        self.scrollDirection = .Horizontal
    }
}
