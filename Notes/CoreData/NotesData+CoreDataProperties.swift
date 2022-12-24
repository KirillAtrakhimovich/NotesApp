//
//  NotesData+CoreDataProperties.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//
//

import Foundation
import CoreData


extension NotesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesData> {
        return NSFetchRequest<NotesData>(entityName: "NotesData")
    }

    @NSManaged public var note: String?
    @NSManaged public var noteData: String?

}

extension NotesData : Identifiable {

}
