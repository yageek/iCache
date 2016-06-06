//
//  MainWindowController.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Cocoa
import PSOperations

class MainWindowController: NSWindowController {

    let queue = OperationQueue()

    @IBOutlet var mainTableViewController: GeocacheTableViewController!

    @IBAction func importFileTriggered(sender: NSToolbarItem) {

        let panel = createFilePanel()
        panel.beginSheetModalForWindow(self.window!) { (choosed) in

            if choosed == NSFileHandlingPanelOKButton {
                Store.sharedInstance.importFiles(panel.URLs) {
                    print("Import finished")
                }
            }

        }
    }

    private func createFilePanel() -> NSOpenPanel {

        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = true
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        panel.allowedFileTypes = ["gpx"]
        return panel
    }
}
