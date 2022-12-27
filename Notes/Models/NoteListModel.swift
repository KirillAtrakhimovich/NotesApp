//
//  NewNoteModel.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//

import Foundation

class NoteListModel {
    var notes: [Note]
    var filteredNotes: [Note]
    
    init(notes: [Note], filteredNotes: [Note]) {
        self.notes = notes
        self.filteredNotes = filteredNotes
    }
    
    func filterNotes(with text: String) {
        if text == "" {
            filteredNotes = notes
        } else {
            filteredNotes = notes.filter {
                $0.noteItem.noteTitle.localizedCaseInsensitiveContains(text) || $0.noteItem.note.localizedCaseInsensitiveContains(text) }
        }
    }
}
