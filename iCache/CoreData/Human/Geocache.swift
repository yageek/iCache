import Foundation
import CoreData
import Cocoa
import FlagKit

@objc(Geocache)
public class Geocache: _Geocache {
	private var currentString = ""
    private var inLogs = false

    var geocacheType: GeocacheType {
        get {
            print("Type: \(type)")
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
            let defaultImage = NSImage(flagImageForSpecialFlag: .World)!

            guard let countryCode = countriesDict[country] else { return  defaultImage}
            
            return NSImage(flagImageWithCountryCode: countryCode) ?? defaultImage
        }
    }

    lazy var countriesDict: [String: String] = {

        let countryCode = NSLocale.ISOCountryCodes()
        let geocachingLocale = NSLocale(localeIdentifier: "en_US")

        var countryHash: [String:String] = [:]

        for code in countryCode {
            let identifier = NSLocale.localeIdentifierFromComponents([NSLocaleCountryCode:code])
            let countryName = geocachingLocale.displayNameForKey(NSLocaleIdentifier, value: identifier)

            if let countryName = countryName {
                countryHash[countryName] = code;
            }
        }

        return countryHash
    }()
}


extension Geocache: NSXMLParserDelegate {

    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        switch (elementName, namespaceURI) {

        case ("cache", _):
            available = stringBool(attributeDict["available"])
            archived = stringBool(attributeDict["archived"])
        case ("owner", _):
            let owner = Int(attributeDict["id"] ?? "0") ?? 0
            owner_id = NSNumber(integer: owner)
        case ("short_description", _):
            short_desc_html = stringBool(attributeDict["html"])
        case ("long_description", _):
            long_desc_html = stringBool(attributeDict["html"])
        case ("type", GeocachingURI?):
            fallthrough
        case ("logs", GeocachingURI2?):
            inLogs = true
        default:
            break
        }
        
    }

    public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        var currentValue = currentString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

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
        case ("placed_by", _):
            placed_by = currentValue
        case ("owner", _):
            owner_name = currentValue
        case ("type", _) where inLogs == false:

            if let range = currentValue.rangeOfString("Geocache|") {
                currentValue.removeRange(range)
            }

            let typeValue =  GeocacheType(string: currentValue)
            print("Parsing type:\(typeValue)")
            type = NSNumber(integer: typeValue.rawValue)

        case ("container", _):
            container = GeocacheContainer(string: currentValue).rawValue
        case ("difficulty", _):
            fallthrough
        case ("difficulty", _):
            difficulty = Float(currentValue ?? "0")
        case ("terrain", _):
            terrain =  Float(currentValue ?? "0")
        case ("country", _):
            country = currentValue
        case ("state", _):
            state = currentValue
        case ("short_description", _):
            short_desc = currentValue
        case ("long_description", _):
            long_desc = currentValue
        case ("name", _):
            name = currentValue
        case ("wpt",_):
            parser.delegate = importedFromGpx
        case ("logs", _) where inLogs == true:
            inLogs = false

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