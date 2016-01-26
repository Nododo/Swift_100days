//
//  TipView.swift
//  3Day
//
//  Created by 杜维欣 on 16/1/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class TipView: UIView {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var topPriceLabel: UILabel!
    @IBOutlet weak var bottomPriceLabel: UILabel!

    var tipModel: TipModel? {
        didSet {
            guard let newModel = tipModel else { return }
            self.tipLabel.text = newModel.tip
            self.topPriceLabel.text = newModel.topPrice
            self.bottomPriceLabel.text = newModel.bottomPrice
        }
    }
}
