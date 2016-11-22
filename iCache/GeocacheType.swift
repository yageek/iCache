//
//  GeocacheType.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
import Cocoa

enum GeocacheType: String {
    case Traditionnal = "Traditional Cache"
    case Unknown = "Unknown Cache"
    case Multi = "Multi-cache"
    case Event = "Event"
    case Earth = "Earthcache"
    case Webcam = "Webcam"
    case Virtual = "Virtual"
    case APE = "APE"
    case WhereIGo = "WhereIGo"
    case TrashCache = "Trash"
    case None = "None"

    var image: NSImage {
        get {

            let imageName: String
            switch self {
            case .Multi: imageName = "multi"
            case .Unknown: imageName = "unknown"
            case .Earth: imageName = "earth"
            case .Event: imageName = "event"
            default: imageName = "traditional"

            }

            return NSImage(named: imageName)!
        }
    }
}