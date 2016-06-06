// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GPXFile.swift instead.

import Foundation
import CoreData

public enum GPXFileAttributes: String {
    case author = "author"
    case desc = "desc"
    case email = "email"
    case importedDate = "importedDate"
    case maxlat = "maxlat"
    case maxlon = "maxlon"
    case minlat = "minlat"
    case minlon = "minlon"
    case name = "name"
    case time = "time"
}

public enum GPXFileRelationships: String {
    case geocaches = "geocaches"
}

public class _GPXFile: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "GPXFile"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _GPXFile.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var author: String?

    @NSManaged public
    var desc: String?

    @NSManaged public
    var email: String?

    @NSManaged public
    var importedDate: NSDate

    @NSManaged public
    var maxlat: NSNumber?

    @NSManaged public
    var maxlon: NSNumber?

    @NSManaged public
    var minlat: NSNumber?

    @NSManaged public
    var minlon: NSNumber?

    @NSManaged public
    var name: String

    @NSManaged public
    var time: NSDate?

    // MARK: - Relationships

    @NSManaged public
    var geocaches: NSSet

}

extension _GPXFile {

    func addGeocaches(objects: NSSet) {
        let mutable = self.geocaches.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.geocaches = mutable.copy() as! NSSet
    }

    func removeGeocaches(objects: NSSet) {
        let mutable = self.geocaches.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.geocaches = mutable.copy() as! NSSet
    }

    func addGeocachesObject(value: Geocache) {
        let mutable = self.geocaches.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.geocaches = mutable.copy() as! NSSet
    }

    func removeGeocachesObject(value: Geocache) {
        let mutable = self.geocaches.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.geocaches = mutable.copy() as! NSSet
    }

}

