import Foundation
import CoreData
import Cocoa
import FlagKit

@objc(Geocache)
public class Geocache: _Geocache {
	private var currentString = ""

    var geocacheType: GeocacheType {
        get {
            return GeocacheType(rawValue: type!.integerValue) ?? .None
        }
    }

    var geocacheContainer: GeocacheContainer {
        get {
            return GeocacheContainer(rawValue: container!.integerValue) ?? .None
        }
    }

    var typeImage: NSImage {
        return geocacheType.image
    }

    var countryImage: NSImage {
        get {
            return NSImage(flagImageWithCountryCode: country) ?? NSImage(flagImageForSpecialFlag: .World)!
        }
    }
}


extension Geocache: NSXMLParserDelegate {

    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        switch (elementName, namespaceURI) {

        case ("cache", GeocachingURI?):
            available = stringBool(attributeDict["available"])
            archived = stringBool(attributeDict["archived"])
        case ("owner", GeocachingURI?):
            let owner = Int(attributeDict["id"] ?? "0") ?? 0
            owner_id = NSNumber(integer: owner)
        case ("short_description", GeocachingURI?):
            short_desc_html = stringBool(attributeDict["html"])
        case ("long_description", GeocachingURI?):
            long_desc_html = stringBool(attributeDict["html"])

        default:
            break
        }
        
    }

    public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        let currentValue = currentString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        defer {
            currentString = ""
        }

        switch (elementName, namespaceURI) {

        case ("name", GPXURI?):
            gccode = currentValue
        case ("url", GPXURI?):
            url = currentValue
        case ("urlName", GPXURI?):
            urlName = currentValue
        case ("placed_by", GeocachingURI?):
            fallthrough
        case ("placed_by", GeocachingURI2?):
            placed_by = currentValue
        case ("owner", GeocachingURI?):
            owner_name = currentValue
        case ("type", GeocachingURI?):
            type = GeocacheType(string: currentValue).rawValue
        case ("container", GeocachingURI?):
            container = GeocacheContainer(string: currentValue).rawValue
        case ("difficulty", GeocachingURI?):
            fallthrough
        case ("difficulty", GeocachingURI2?):
            difficulty = Float(currentValue ?? "0")
        case ("terrain", GeocachingURI?):
            terrain =  Float(currentValue ?? "0")
        case ("country", GeocachingURI?):
            country = currentValue
        case ("state", GeocachingURI?):
            state = currentValue
        case ("short_description", GeocachingURI?):
            short_desc = currentValue
        case ("long_description", GeocachingURI?):
            long_desc = currentValue
        case ("name", GeocachingURI?):
            name = currentValue
        case ("wpt",_):
            parser.delegate = importedFromGpx
        default:
            break
        }

        
    }

    public func parser(parser: NSXMLParser, foundCharacters string: String) {
        currentString.appendContentsOf(string)
    }

    private func stringBool(string: String?) -> NSNumber {
        let value = string ?? "False"
        if value == "True" {
            return NSNumber(bool: true)
        }

        return NSNumber(bool: false)
    }
}