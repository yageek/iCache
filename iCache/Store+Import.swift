//
//  Store+Import.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
import CoreData

extension Store {

    func importFiles(files: [NSURL], completion: (Void -> Void)? = nil) {

        let importFilesOperation = FilesImportOperation(files: files, context: Store.sharedInstance.managedObjectContext)

        if let completion = completion {
            let blockOperation = NSBlockOperation(block: completion)
            blockOperation.addDependency(importFilesOperation)
            NSOperationQueue.mainQueue().addOperation(blockOperation)
        }

        self.importQueue.addOperation(importFilesOperation)
    }
}