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
    
    func saveNote(item: NoteItem) {
        let note = NotesData(context: context)
        note.id = item.id
        note.noteTitle = item.noteTitle
        note.noteContent = item.note
        try? context.save()
    }
    
    func getNotes() -> [NoteItem] {
        let fetchRequest = NotesData.fetchRequest()
        do {
            let objects = try context.fetch(fetchRequest).map {
                NoteItem(
                    id: $0.id,
                    noteTitle: $0.noteTitle,
                    note: $0.noteContent
                )}
            return objects
        } catch {
            return [NoteItem]()
        }
    }
    
    private func getNote(by id: UUID) -> NotesData? {
        let fetchRequest = NotesData.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: Constants.format, "\(id)"
        )

        if let object = try? context.fetch(fetchRequest).first {
            return object
        } else {
            return nil
        }
    }
    
    func delete(item: NoteItem) {
        guard let note = getNote(by: item.id) else { return }
        context.delete(note)
        try? context.save()
    }
    
}

extension PersistenceManager {
    struct Constants {
        static let format = "id = %@"
    }
}
