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
var currentStyle: Int = 0

class MainController: UICollectionViewController {

    @IBAction func toggle(sender: UISegmentedControl) {
        currentStyle = sender.selectedSegmentIndex
        if currentStyle == 0 {
            let customLayout = CustomFlowLayout()
            self.collectionView?.setCollectionViewLayout(customLayout, animated: false)
            self.collectionView?.reloadData()
        } else {
            let chartsLayout = ChartsFlowLayout()
            self.collectionView?.setCollectionViewLayout(chartsLayout, animated: false)
            self.collectionView?.reloadData()
        }
        
    }
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
        movieArray.appendContentsOf(movieArray)
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
        if currentStyle == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FeaturedCell
            cell.avatarView.image = UIImage(named: movie.moviePic)
            cell.nameLabel.text = movie.movieName
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(chartsIdentifier, forIndexPath: indexPath) as! ChartsCell
            cell.photoView.image = UIImage(named: movie.moviePic)
            cell.nameLabel.text = movie.movieName
            return cell
        }
    }

    override func  collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath)
        return header

    }
}
