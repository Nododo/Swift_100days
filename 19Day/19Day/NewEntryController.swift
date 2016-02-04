//
//  NewEntryController.swift
//  19Day
//
//  Created by 杜维欣 on 16/2/1.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

protocol NewEntryDelegate: NSObjectProtocol {
    func addNewEntry(newEntry: Entry)
}

class NewEntryController: UIViewController, accessoryInputViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    weak var delegate: NewEntryDelegate?
    var iconImage: UIImage?
    var content: NSString?
    
    //导航栏事件
    @IBAction func cancelBtn(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBtn(sender: UIBarButtonItem) {
        content = self.noteInputView.text
        guard let finalIcon = iconImage else { print("no image"); return}
        guard let finalContent = content else { print("no content"); return}
        
        
        let moc = CoreDataController().managedObjectContext
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Entry", inManagedObjectContext: moc) as! Entry
        let iconData = UIImagePNGRepresentation(finalIcon)
        
        entity.setValue(iconData, forKey: "entryIcon")
        entity.setValue(finalContent, forKey: "entryContent")
        entity.setValue(self.dateLabel.text, forKey: "entryTime")
        entity.setValue(self.accView?.addressLabel.text, forKey: "entryAddress")
        
        do {
            try moc.save()
            self.delegate?.addNewEntry(entity)
            self.navigationController?.popViewControllerAnimated(true)
        } catch {
            fatalError("failure to save context\(error)")
        }
    }
    
    var accView: AccessoryInputView?
    var mgr: CLLocationManager = CLLocationManager()
    
    //日期label
    @IBOutlet weak var dateLabel: UILabel!
    
    //输入框
    @IBOutlet weak var noteInputView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateDateInfo()
        self.updateAddressInfo()
        
        //键盘辅助试图
        let accessoryInputView = NSBundle.mainBundle().loadNibNamed("AccessoryInputView", owner: self, options: nil).first as! AccessoryInputView
        self.noteInputView.inputAccessoryView = accessoryInputView;
        accessoryInputView.delegate = self
        accView = accessoryInputView
    }
    
    //MARK: 代理方法(相当于OC中#pragama)
    
    func addPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.navigationController?.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func loacation() {
        
    }

    //MARK: 更新日期
    func updateDateInfo() {
        let dateForm = NSDateFormatter()
        dateForm.dateStyle = .LongStyle;
        dateForm.timeStyle = .ShortStyle;
        self.dateLabel.text = dateForm.stringFromDate(NSDate())
    }
    
    //MARK:- 更新地理位置
    
    func updateAddressInfo() {
        mgr.delegate = self
        mgr.desiredAccuracy = kCLLocationAccuracyBest
        mgr.requestWhenInUseAuthorization()
        mgr.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placeMarks, error) -> Void in
            if placeMarks?.count > 0 {
                let pm = placeMarks![0] as CLPlacemark
                self.accView?.addressLabel.text = pm.locality
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }

    // MARK: - 图片选择

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        accView?.photoView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        iconImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        noteInputView.becomeFirstResponder()
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
