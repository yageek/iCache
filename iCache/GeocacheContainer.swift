//
//  GeocacheContainer.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
import Cocoa

enum GeocacheContainer: Int {
    case Micro
    case Small
    case Regular
    case Other
    case None


    init(string: String) {
        switch string {
        case "Micro":
            self = Micro
        case "Regular":
            self = .Regular
        case "Small":
            self = .Small
        case "Other":
            self = .Other
        default:
            self = .None
        }
    }


}