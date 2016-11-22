//
//  GPX.swift
//  iCache
//
//  Created by Yannick Heinrich on 02.08.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation

public protocol XMLMarshable {
    var xmlName: String { get }
}

public protocol XMLParserElementDelegate {
    func didReadAttribute(element: String, attributeDict: [String : String])
    func didReadValue(element: String, value: String)
    func didEndParsingElement()
}

public class XMLParserElement<T:XMLMarshable>: NSObject, NSXMLParserDelegate {

    private var currentString: String = ""

    public let parser: NSXMLParser

    public var delegate: XMLParserElementDelegate?

    public init(parser: NSXMLParser) {
        self.parser = parser

        super.init()
        parser.delegate = self
    }


    public func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        self.delegate?.didReadAttribute(elementName, attributeDict: attributeDict)
    }

   public func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        defer {
            currentString = ""
        }

        self.delegate?.didReadValue(elementName, value: currentString)

    }

   public func parser(parser: NSXMLParser, foundCharacters string: String) {
        currentString.appendContentsOf(string)
    }

}


public class GPXElementParser: XMLParserElement<GPXFile> {

    
    override public func didReadAttribute(element: String, attributeDict: [String : String]) {
        switch element {
        case "bounds":
            self.object.minlat = Double(attributeDict["minlat"] ?? "0") ?? 0
            self.object.maxlat = Double(attributeDict["maxlat"] ?? "0") ?? 0

            self.object.minlon = Double(attributeDict["minlon"] ?? "0") ?? 0
            self.object.maxlon = Double(attributeDict["maxlon"] ?? "0") ?? 0
        default:
            break
            
        }
    }

    override public func didReadValue(element: String, value: String) {
        switch element {
        case "name":
            self.object.name = value
        case "desc":
                self.object.desc = value
        case "author":
            self.object.author = value
        case "email":
            self.object.email = value
        case "time":
            break
        default:
            break
            
        }
    }

    
}