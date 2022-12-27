//
//  CoreDataManager.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//

import UIKit
import CoreData

// swiftlint:disable force_cast
final class CoreDataManager: PersistenceManager {
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    func saveNote(item: Note) {
        guard let currentNote = getNote(by: item.noteItem.id) else {
            let noteFont = NoteFontData(context: context)
            noteFont.name = item.noteFont.font.fontName
            noteFont.size = Int64(item.noteFont.size)
            noteFont.isBold = item.noteFont.isBold
            noteFont.isCursive = item.noteFont.isCursive
            let note = NotesData(context: context)
            note.id = item.noteItem.id
            note.noteTitle = item.noteItem.noteTitle
            note.noteContent = item.noteItem.note
            note.noteFont = noteFont
            return
        }
        currentNote.noteTitle = item.noteItem.noteTitle
        currentNote.noteContent = item.noteItem.note
        currentNote.noteFont.name =  item.noteFont.font.fontName
        currentNote.noteFont.size = Int64(item.noteFont.size)
        currentNote.noteFont.isBold = item.noteFont.isBold
        currentNote.noteFont.isCursive = item.noteFont.isCursive
        try? context.save()
    }
    
    func getNotes() -> [Note] {
        let fetchRequest = NotesData.fetchRequest()
        do {
            let objects = try context.fetch(fetchRequest).map {
                Note(noteItem: createNoteItem($0), noteFont: createNoteFont($0))
            }
            return objects
        } catch {
            return [Note]()
        }
    }
    
    func deleteNote(item: Note) {
        guard let note = getNote(by: item.noteItem.id) else { return }
        context.delete(note)
        try? context.save()
    }
    
    private func getNote(by id: UUID) -> NotesData? {
        let fetchRequest = NotesData.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: Constants.format, "\(id)")

        if let object = try? context.fetch(fetchRequest).first {
            return object
        } else {
            return nil
        }
    }
    
    private func createNoteItem(_ noteData: NotesData) -> NoteItem {
        NoteItem(id: noteData.id,
                 noteTitle: noteData.noteTitle,
                 note: noteData.noteContent)
    }
    
    private func createNoteFont(_ noteData: NotesData) -> NoteFont {
        NoteFont(font: UIFont(name: noteData.noteFont.name, size: CGFloat(noteData.noteFont.size))!,
                                size: CGFloat(noteData.noteFont.size),
                                isBold: noteData.noteFont.isBold,
                                isCursive: noteData.noteFont.isCursive)
    }
}

extension CoreDataManager {
    struct Constants {
        static let format = "id = %@"
    }
}
