//
//  CustomSearchBar.swift
//  29Day
//
//  Created by 杜维欣 on 16/4/7.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        searchBarStyle = .Default
        translucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKindOfClass(UITextField) {
                index = i
                break
            }
        }
        
        return index
    }
    
    override func drawRect(rect: CGRect) {
        // 获取搜索栏子视图中搜索输入框的下标
        if let index = indexOfSearchFieldInSubviews() {
            // 获取搜索输入框
            let searchField: UITextField = (subviews[0]).subviews[index] as! UITextField
            
            // 设置 frame
//            searchField.frame = CGRectMake(5.0, 5.0, frame.size.width - 10.0, frame.size.height - 10.0)
            
            // 设置字体和文字颜色
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // 设置背景颜色
            searchField.backgroundColor = barTintColor
        }
        
//        let startPoint = CGPointMake(0.0, frame.size.height)
//        let endPoint = CGPointMake(frame.size.width, frame.size.height)
//        let path = UIBezierPath()
//        path.moveToPoint(startPoint)
//        path.addLineToPoint(endPoint)
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.CGPath
//        shapeLayer.strokeColor = preferredTextColor.CGColor
//        shapeLayer.lineWidth = 2.5
//        
//        layer.addSublayer(shapeLayer)
        
        super.drawRect(rect)
    }

}
