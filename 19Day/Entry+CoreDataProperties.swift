//
//  Entry+CoreDataProperties.swift
//  19Day
//
//  Created by 杜维欣 on 16/2/2.
//  Copyright © 2016年 Nododo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var entryTime: String?
    @NSManaged var entryContent: String?
    @NSManaged var entryAddress: String?
    @NSManaged var entryIcon: NSData?

}
