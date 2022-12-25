//
//  PersistenceManager.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//

import UIKit
import CoreData

// swiftlint:disable force_cast

class PersistenceManager {
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    func saveNote(model: NewNoteModel) {
        let note = NotesData(context: context)
        note.noteTitle = model.noteTitle
        note.noteContent = model.note
        try? context.save()
    }
    
    func getNotes() -> [NewNoteModel] {
        let fetchRequest = NotesData.fetchRequest()
        do {
            let objects = try context.fetch(fetchRequest).map { NewNoteModel(noteTitle: $0.noteTitle, note: $0.noteContent) }
            return objects
        } catch {
            return [NewNoteModel]()
        }
    }
}
