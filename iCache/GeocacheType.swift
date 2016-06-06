//
//  GeocacheType.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
import Cocoa

enum GeocacheType: Int {
    case Traditionnal
    case Unknown
    case Multi
    case Event
    case Earth
    case Webcam
    case Virtual
    case APE
    case WhereIGo
    case TrashCache
    case None


    init(string: String) {

        switch string {
        case "Traditional Cache":
            self = .Traditionnal
        case "Multi-cache":
            self = .Multi
        case "Unknown Cache":
            self = .Unknown
        case "Earthcache":
            self = .Earth
        case "Event":
            self = .Event
        default:
            self = .None
        }
    }

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