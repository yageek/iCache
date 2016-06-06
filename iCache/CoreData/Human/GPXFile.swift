import Foundation
import CoreData

@objc(GPXFile)
public class GPXFile: _GPXFile {
    private var currentString = ""
}


extension GPXFile: NSXMLParserDelegate {

    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        switch elementName {

        case "bounds":
            self.minlat = Double(attributeDict["minlat"] ?? "0")
            self.maxlat = Double(attributeDict["maxlat"] ?? "0")

            self.minlon = Double(attributeDict["minlon"] ?? "0")
            self.maxlon = Double(attributeDict["maxlon"] ?? "0")
        case "wpt":

            let cache = NSEntityDescription.insertNewObjectForEntityForName(Geocache.entityName(), inManagedObjectContext: self.managedObjectContext!) as! Geocache

            cache.lat = Double(attributeDict["lat"] ?? "0")
            cache.lon = Double(attributeDict["lon"] ?? "0")
            cache.importedFromGpx = self

            addGeocachesObject(cache)
            parser.delegate = cache

            default:
                break
        }

    }

    public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        let currentValue = currentString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        defer {
            currentString = ""
        }

        switch elementName {
        case "name":
            name = currentValue
        case "desc":
            desc = currentValue
        case "author":
            author = currentValue
        case "email":
            email = currentValue
        default:
            break
        }


    }

    public func parser(parser: NSXMLParser, foundCharacters string: String) {
        currentString.appendContentsOf(string)
    }

    public func parserDidEndDocument(parser: NSXMLParser) {
        importedDate = NSDate()
    }

}