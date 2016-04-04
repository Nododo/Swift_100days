//
//  Movie.swift
//  29Day
//
//  Created by dwx on 16/4/4.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class Movie: NSObject {

    var movieName: String
    var moviePic: String

    init(name: String, pic: String) {
        self.movieName = name
        self.moviePic = pic
    }
    
}

