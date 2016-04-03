//
//  CustomFlowLayout.swift
//  28Day
//
//  Created by dwx on 16/4/3.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    
    let cellW = UIScreen.mainScreen().bounds.size.width
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(cellW, cellW * 0.3)
        self.scrollDirection = .Horizontal
        
    }
    
}
