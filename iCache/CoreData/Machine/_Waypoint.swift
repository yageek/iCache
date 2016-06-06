// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Waypoint.swift instead.

import Foundation
import CoreData

public enum WaypointAttributes: String {
    case cmt = "cmt"
    case desc = "desc"
    case lat = "lat"
    case lon = "lon"
    case name = "name"
    case time = "time"
    case url = "url"
    case urlName = "urlName"
}

public enum WaypointRelationships: String {
    case cache = "cache"
}

public class _Waypoint: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Waypoint"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Waypoint.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var cmt: String?

    @NSManaged public
    var desc: String?

    @NSManaged public
    var lat: NSNumber?

    @NSManaged public
    var lon: NSNumber?

    @NSManaged public
    var name: String

    @NSManaged public
    var time: NSDate?

    @NSManaged public
    var url: String?

    @NSManaged public
    var urlName: String?

    // MARK: - Relationships

    @NSManaged public
    var cache: Geocache?

}

