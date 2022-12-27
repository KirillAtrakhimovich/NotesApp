//
//  NotesData+CoreDataProperties.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 27.12.22.
//
//

import Foundation
import CoreData

extension NotesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesData> {
        return NSFetchRequest<NotesData>(entityName: "NotesData")
    }

    @NSManaged public var id: UUID
    @NSManaged public var noteContent: String
    @NSManaged public var noteTitle: String
    @NSManaged public var noteFont: NoteFontData
}

extension NotesData: Identifiable {}
