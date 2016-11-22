//
//  GPXFile.swift
//  iCache
//
//  Created by Yannick Heinrich on 02.08.16.
//  Copyright © 2016 yageek's company. All rights reserved.
//

import Foundation
import CoreData

public class GPXFile: NSManagedObject {

    static let EntityName = "GPXFile"
}

extension GPXFile: XMLMarshable {
    public var xmlName: String { return "gpx" }
}