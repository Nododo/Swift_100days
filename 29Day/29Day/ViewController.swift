//
//  ViewController.swift
//  29Day
//
//  Created by dwx on 16/4/4.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var movieArray: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeData()
    }
    
    func makeData() {
        for i in 1...9 {
            let str = String(format: "%d", i)
            let movie = Movie.init(name: str, pic: str)
            movieArray.append(movie)
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

