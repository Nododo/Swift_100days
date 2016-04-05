//
//  CustomFlowLayout.swift
//  28Day
//
//  Created by dwx on 16/4/3.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    
    let screenW = UIScreen.mainScreen().bounds.size.width
    private let nameH: CGFloat = 20
    private let headerH: CGFloat = 100

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.itemSize = CGSizeMake(screenW / 3, screenW / 3 + nameH)
        self.headerReferenceSize = CGSizeMake(screenW, headerH)
    }
    
}
