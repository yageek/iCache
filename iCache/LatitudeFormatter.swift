//
//  LatitudeFormatter.swift
//  iCache
//
//  Created by Yannick Heinrich on 06.06.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Cocoa


class LatitudeFormatter: NSFormatter {

    override func stringForObjectValue(obj: AnyObject) -> String? {

        guard let objValue = obj.floatValue where obj.isKindOfClass(NSNumber.self) else { return nil }

        let degrees = Int(objValue)
        let minutes = (objValue - Float(degrees))*60.0

        let label: String
        if objValue > 0 {
            label = "N"
        } else {
            label = "S"
        }

        return "\(label) \(degrees)° \(minutes)"
    }

    override func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {

        obj.memory = NSNumber(integer: 5)
        return true
    }
}


class LongitudeFormatter: NSFormatter {

    override func stringForObjectValue(obj: AnyObject) -> String? {

        guard let objValue = obj.floatValue where obj.isKindOfClass(NSNumber.self) else { return nil }

        let degrees = Int(objValue)
        let minutes = (objValue - Float(degrees))*60.0

        let label: String
        if objValue > 0 {
            label = "E"
        } else {
            label = "W"
        }

        return "\(label) \(degrees)° \(minutes)"
    }

    override func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {

        obj.memory = NSNumber(integer: 5)
        return true
    }
}
