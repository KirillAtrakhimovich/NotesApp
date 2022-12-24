//
//  NoteData+CoreDataProperties.swift
//  
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//
//

import Foundation
import CoreData


extension NoteData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteData> {
        return NSFetchRequest<NoteData>(entityName: "NoteData")
    }

    @NSManaged public var noteTitle: String?
    @NSManaged public var note: String?

}
