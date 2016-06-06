// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Geocache.swift instead.

import Foundation
import CoreData

public enum GeocacheAttributes: String {
    case archived = "archived"
    case available = "available"
    case container = "container"
    case country = "country"
    case difficulty = "difficulty"
    case gccode = "gccode"
    case hint = "hint"
    case lat = "lat"
    case lon = "lon"
    case long_desc = "long_desc"
    case long_desc_html = "long_desc_html"
    case name = "name"
    case owner_id = "owner_id"
    case owner_name = "owner_name"
    case placed_by = "placed_by"
    case short_desc = "short_desc"
    case short_desc_html = "short_desc_html"
    case state = "state"
    case terrain = "terrain"
    case type = "type"
    case url = "url"
    case urlName = "urlName"
}

public enum GeocacheRelationships: String {
    case importedFromGpx = "importedFromGpx"
    case waypoints = "waypoints"
}

public class _Geocache: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Geocache"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Geocache.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var archived: NSNumber?

    @NSManaged public
    var available: NSNumber?

    @NSManaged public
    var container: NSNumber?

    @NSManaged public
    var country: String

    @NSManaged public
    var difficulty: NSNumber?

    @NSManaged public
    var gccode: String

    @NSManaged public
    var hint: String?

    @NSManaged public
    var lat: NSNumber?

    @NSManaged public
    var lon: NSNumber?

    @NSManaged public
    var long_desc: String

    @NSManaged public
    var long_desc_html: NSNumber?

    @NSManaged public
    var name: String

    @NSManaged public
    var owner_id: NSNumber?

    @NSManaged public
    var owner_name: String

    @NSManaged public
    var placed_by: String

    @NSManaged public
    var short_desc: String?

    @NSManaged public
    var short_desc_html: NSNumber?

    @NSManaged public
    var state: String?

    @NSManaged public
    var terrain: NSNumber?

    @NSManaged public
    var type: NSNumber?

    @NSManaged public
    var url: String?

    @NSManaged public
    var urlName: String?

    // MARK: - Relationships

    @NSManaged public
    var importedFromGpx: GPXFile?

    @NSManaged public
    var waypoints: NSSet

}

extension _Geocache {

    func addWaypoints(objects: NSSet) {
        let mutable = self.waypoints.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.waypoints = mutable.copy() as! NSSet
    }

    func removeWaypoints(objects: NSSet) {
        let mutable = self.waypoints.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.waypoints = mutable.copy() as! NSSet
    }

    func addWaypointsObject(value: Waypoint) {
        let mutable = self.waypoints.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.waypoints = mutable.copy() as! NSSet
    }

    func removeWaypointsObject(value: Waypoint) {
        let mutable = self.waypoints.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.waypoints = mutable.copy() as! NSSet
    }

}

