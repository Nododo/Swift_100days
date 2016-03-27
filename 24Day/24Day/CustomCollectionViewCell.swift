//
//  CustomCollectionViewCell.swift
//  24Day
//
//  Created by dwx on 16/3/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var photoView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        let photoView = UIImageView.init(frame: self.bounds)
        self.contentView.addSubview(photoView)
        self.photoView = photoView
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
