//
//  CustomTableViewController.swift
//  15Day
//
//  Created by 杜维欣 on 16/1/29.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    var persons: [Person] = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createLocalData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func createLocalData() {
        for index in 1...9 {
            let newPerson = Person()
            newPerson.name = "name is \(index)"
            newPerson.icon = "\(index)"
            persons.append(newPerson)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nododo", forIndexPath: indexPath) as! CustomTableViewCell
        
        let person = persons[indexPath.row]
        
        cell.iconView.image = UIImage(named: person.icon!)
        cell.nameLabel.text = person.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCellWithIdentifier("nododoHeader") as! CustomHeaderCell
        switch section {
        case 0:
            header.headLabel.text = "RECENT"
        case 1:
            header.headLabel.text = "Friends"
        default: break
            
        }
        return header
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail = storyboard.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
        detail.detailPerson = persons[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
   
    
    
}
