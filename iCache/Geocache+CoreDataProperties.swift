//
//  Geocache+CoreDataProperties.swift
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

extension Geocache {

    @NSManaged var archived: Bool
    @NSManaged var available: Bool
    @NSManaged var container: Int16
    @NSManaged var country: String?
    @NSManaged var difficulty: Float
    @NSManaged var gccode: String
    @NSManaged var hint: String?
    @NSManaged var lat: Double
    @NSManaged var lon: Double
    @NSManaged var long_desc: String?
    @NSManaged var long_desc_html: Bool
    @NSManaged var name: String?
    @NSManaged var owner_id: Int16
    @NSManaged var owner_name: String?
    @NSManaged var placed_by: String?
    @NSManaged var short_desc: String?
    @NSManaged var short_desc_html: Bool
    @NSManaged var state: String?
    @NSManaged var terrain: Float
    @NSManaged var type: Int16
    @NSManaged var url: String?
    @NSManaged var urlName: String?
    @NSManaged var importedFromGpx: GPXFile?
    @NSManaged var waypoints: NSSet?

}
