//
//  ImportGPXOperation.swift
//  iCache
//
//  Created by Yannick Heinrich on 18.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import PSOperations
import CoreData

let GPXURI = "http://www.topografix.com/GPX/1/0"
let GeocachingURI = "http://www.groundspeak.com/cache/1/0"
let GeocachingURI2 = "http://www.groundspeak.com/cache/1/0/1"

class ImportGPXOperation: Operation {

    let managedContext: NSManagedObjectContext
    let gpxURL: NSURL
    var currentGPXFile: GPXFile?

    init(moc: NSManagedObjectContext, fileURL: NSURL) {
        managedContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        managedContext.parentContext = moc

        gpxURL = fileURL

    }

    override func execute() {
        print("Processing \(gpxURL)...")

        let xmlParser = NSXMLParser(contentsOfURL: gpxURL)
        guard let parser = xmlParser else { finish(); return }

        parser.shouldProcessNamespaces = true
        parser.delegate = self

        self.managedContext.performBlockAndWait {
            if(parser.parse()) {
                do {
                    try self.managedContext.save()
                } catch let error as NSError {
                    print("An error occurs during importing \(self.gpxURL): \(error)")
                    self.finishWithError(error)
                }

            } else {
                self.finishWithError(parser.parserError)
            }
        }

        finish()

    }

}

// MARK: XML Parsing

extension ImportGPXOperation: NSXMLParserDelegate {

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        switch (namespaceURI, elementName) {

        case (GPXURI?, "gpx"):
            currentGPXFile = NSEntityDescription.insertNewObjectForEntityForName(GPXFile.entityName(), inManagedObjectContext: self.managedContext) as? GPXFile
            parser.delegate = currentGPXFile
        default:
            break
        }

    }
    
}
