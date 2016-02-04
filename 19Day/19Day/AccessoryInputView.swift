//
//  AccessoryInputView.swift
//  19Day
//
//  Created by 杜维欣 on 16/2/1.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

protocol accessoryInputViewDelegate {
    func addPhoto()
    func loacation()
}

class AccessoryInputView: UIView {

    var delegate: accessoryInputViewDelegate?
    
    @IBAction func photoBtn(sender: UIButton) {
        self.delegate?.addPhoto()
    }

    @IBAction func locationBtn(sender: UIButton) {
        self.delegate?.loacation()
    }
    
    @IBOutlet weak var addressLabel: UILabel!

    @IBOutlet weak var photoView: UIImageView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("AccessoryInputView")
    }
}
