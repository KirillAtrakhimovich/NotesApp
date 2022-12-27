//
//  NoteFontData+CoreDataProperties.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 27.12.22.
//
//

import Foundation
import CoreData

extension NoteFontData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteFontData> {
        return NSFetchRequest<NoteFontData>(entityName: "NoteFontData")
    }

    @NSManaged public var name: String
    @NSManaged public var size: Int64
    @NSManaged public var isBold: Bool
    @NSManaged public var isCursive: Bool

}

extension NoteFontData: Identifiable {}
