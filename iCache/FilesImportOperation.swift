//
//  FilesImportOperation.swift
//  iCache
//
//  Created by Yannick Heinrich on 18.05.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import PSOperations
import CoreData

class FilesImportOperation : Operation {

    let fileURLs: [NSURL]
    let managedObjectContext: NSManagedObjectContext

    init(files: [NSURL], context: NSManagedObjectContext) {
        fileURLs = files
        managedObjectContext = context

        super.init()

        name = "Import Files Operation"
    }


    override func execute() {

        for fileURL in fileURLs where fileURL.fileURL {

            guard let pathExtension = fileURL.pathExtension else { continue }

            switch pathExtension {
            case "gpx":
                produceOperation(ImportGPXOperation(moc: managedObjectContext, fileURL: fileURL))
            default:
                self.finishWithError(NSError(domain: "iCache", code: 1, userInfo: nil))
            }

        }


        finish()
    }
}
