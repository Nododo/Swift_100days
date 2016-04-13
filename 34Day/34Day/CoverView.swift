//
//  CoverView.swift
//  34Day
//
//  Created by 杜维欣 on 16/4/13.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CoverView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let coverImage = UIImage(named: "google")
        self.image = coverImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
