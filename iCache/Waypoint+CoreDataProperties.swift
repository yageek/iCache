//
//  Waypoint+CoreDataProperties.swift
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

extension Waypoint {

    @NSManaged var cmt: String?
    @NSManaged var desc: String?
    @NSManaged var lat: Double
    @NSManaged var lon: Double
    @NSManaged var name: String
    @NSManaged var time: NSDate
    @NSManaged var url: String?
    @NSManaged var urlName: String?
    @NSManaged var cache: Geocache

}
