//
//  TipModel.swift
//  3Day
//
//  Created by 杜维欣 on 16/1/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class TipModel: NSObject {
    var tip: String?
    var topPrice: String?
    var bottomPrice: String?
    init(tip: String, topPrice: String, bottomPrice: String) {
        self.tip = tip
        self.topPrice = topPrice
        self.bottomPrice = bottomPrice
    }
}
