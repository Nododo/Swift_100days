//
//  ViewController.swift
//  27Day
//
//  Created by 杜维欣 on 16/4/1.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

let cellIdentifier = "cellIdentifier"

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTable: UITableView!
    
    var searchVC: UISearchController!
    
    var stringArray: [String] = []
    
    var resultArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeData()
        
        searchVC = UISearchController.init(searchResultsController: nil)
        searchVC.searchResultsUpdater = self
        searchVC.dimsBackgroundDuringPresentation = false
        mainTable.tableHeaderView = searchVC.searchBar
        searchVC.searchBar.sizeToFit()
    }
    
    func makeData() {
        for _ in 1...20 {
            let str = String(format: "%d", arc4random_uniform(10000))
             stringArray.append(str)
        }
        resultArray = stringArray
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("\(searchController.searchBar.text)")
        self.filterForSearchText(searchController.searchBar.text)
    }
    
    func filterForSearchText(searchText: String?) -> Void {
        print("searchText===\(searchText)")
        if let realText = searchText{
            resultArray.removeAll()
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c]%@", realText)
            resultArray = (stringArray as NSArray).filteredArrayUsingPredicate(searchPredicate) as! [String]
            mainTable.reloadData()
            
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if  let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
            cell.textLabel?.text = resultArray[indexPath.row]
            return cell
        }else {
           let cell = UITableViewCell()
            cell.textLabel?.text = resultArray[indexPath.row]
            return cell
        }

        
        
    }

}

