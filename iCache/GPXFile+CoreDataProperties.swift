//
//  GPXFile+CoreDataProperties.swift
//  iCache
//
//  Created by Yannick Heinrich on 02.08.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GPXFile {

    @NSManaged var author: String?
    @NSManaged var desc: String?
    @NSManaged var email: String?
    @NSManaged var importedDate: NSDate
    @NSManaged var maxlat: Double
    @NSManaged var maxlon: Double
    @NSManaged var minlat: Double
    @NSManaged var minlon: Double
    @NSManaged var name: String?
    @NSManaged var time: NSDate
    @NSManaged var geocaches: NSSet?

}
