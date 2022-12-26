//
//  NewNoteModel.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//

import Foundation

class NoteListModel {
    var notes: [NoteItem]
    var filteredNotes: [NoteItem]
    
    init(notes: [NoteItem], filteredNotes: [NoteItem]) {
        self.notes = notes
        self.filteredNotes = filteredNotes
    }
    
    func filterNotes(with text: String) {
        if text == "" {
            filteredNotes = notes
        } else {
            filteredNotes = notes.filter {
                $0.noteTitle.localizedCaseInsensitiveContains(text) ||   $0.note.localizedCaseInsensitiveContains(text) }
        }
    }
}

struct NoteItem: Hashable {
    let id: UUID
    let noteTitle: String
    let note: String
}
