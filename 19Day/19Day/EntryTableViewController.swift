//
//  EntryTableViewController.swift
//  19Day
//
//  Created by 杜维欣 on 16/2/1.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import CoreData

class EntryTableViewController: UITableViewController, NewEntryDelegate {

    @IBOutlet weak var timeLabel: UILabel!
    
    var entryArray: [Entry] = [Entry]()
    let moc = CoreDataController().managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.updateDateInfo()
        self.fetchedEntry()
    }
    
    func fetchedEntry() {
        
        let entryFetch = NSFetchRequest(entityName: "Entry")
        do {
            let fetchedEntry = try moc.executeFetchRequest(entryFetch) as! [Entry]
            //根据时间进行排序
          entryArray +=  fetchedEntry.sort({ (fistEntry: Entry, secondEntry: Entry) -> Bool in
                return fistEntry.entryTime > secondEntry.entryTime
            })
//            entryArray += fetchedEntry
        } catch {
            fatalError("bad things happened \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entryArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nododo", forIndexPath: indexPath) as! EntryTableViewCell

        //此处判断数组内元素个数是否为0   以下两种方式都可以
//        guard !entryArray.isEmpty else { return UITableViewCell() }
        if !entryArray.isEmpty {
            let entry = entryArray[indexPath.row] 
            cell.dateLabel.text = entry.entryTime
            cell.contentLabel.text = entry.entryContent
            cell.addressLabel.text = entry.entryAddress
            guard let imageData = entry.entryIcon else {
                cell.iconView.image = nil
                return cell
            }
            // UIImage(data: imageData) 此方法耗内存 甚至影响滑动
            cell.iconView.image = UIImage(data: imageData)
        }
        
        // Configure the cell...

        return cell
    }
    
    func updateDateInfo() {
        let dateForm = NSDateFormatter()
        dateForm.dateStyle = .LongStyle;
        dateForm.timeStyle = .ShortStyle;
        self.timeLabel.text = dateForm.stringFromDate(NSDate())
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toNewEntry") {
            let newEntryController = segue.destinationViewController as! NewEntryController
            newEntryController.delegate = self
        }
        
        
    }
    
    func addNewEntry(newEntry: Entry) {
        let path = NSIndexPath(forRow: 0, inSection: 0)
        entryArray.insert(newEntry, atIndex: 0)
       tableView .insertRowsAtIndexPaths([path], withRowAnimation: .Top)
    }

}
