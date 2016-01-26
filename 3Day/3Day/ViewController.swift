//
//  ViewController.swift
//  3Day
//
//  Created by 杜维欣 on 16/1/26.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topField: UITextField!
    @IBOutlet weak var tipView: TipView!
    private var tipModel: TipModel?
    @IBAction func sliderChange(sender: UISlider) {
        let value = Double (sender.value)
        let tempInt = Int(value * 100)
        guard let newTipModel = tipModel else { return }
        guard let topText = topField.text else { return }
        guard let topDouble = Double(topText) else { return }
        let topPrice = Double(topDouble * value)
        let bottomPrice = topDouble + topPrice
        newTipModel.tip = "Tip%\(tempInt)"
        newTipModel.topPrice = String(format: "%.2f", topPrice)
        newTipModel.bottomPrice = String(format: "%.2f", bottomPrice)
        tipView.tipModel = newTipModel
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipModel = TipModel.init(tip: "%15", topPrice: "$0.00", bottomPrice: "$0.00")
        //创建输入框顶部右侧完成按钮
        self.createTextFieldTopButton()
    }

    func createTextFieldTopButton() {
        let toolbar = UIToolbar()
        let barBtn = UIBarButtonItem.init(title: "完成", style: .Plain, target: self, action: Selector("endInPut"))
        //为了让完成按钮显示在键盘的右边
        let flexItem = UIBarButtonItem.init(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let items = [flexItem, barBtn]
        toolbar.setItems(items, animated: false)
        toolbar.sizeToFit()
        self.topField.inputAccessoryView = toolbar
    }
    
    //结束输入事件
    func endInPut() {
        self.view.endEditing(true)
    }

}

