//
//  GeocacheTableViewController.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Cocoa
import CoreData

class GeocacheTableViewController: NSViewController {

    let managedContext: NSManagedObjectContext
    
    required init?(coder: NSCoder) {
        self.managedContext = Store.sharedInstance.managedObjectContext

        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
