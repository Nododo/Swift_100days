//
//  MainController.swift
//  29Day
//
//  Created by 杜维欣 on 16/4/5.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

private let reuseIdentifier  = "featured"
private let chartsIdentifier = "charts"

class MainController: UICollectionViewController {

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movieArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let movie = movieArray[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FeaturedCell
       cell.avatarView.image = UIImage(named: movie.moviePic)
        cell.nameLabel.text = movie.movieName
    
        return cell
    }

    override func  collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath)
        return header

    }
}
