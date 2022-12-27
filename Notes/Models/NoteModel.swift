//
//  NoteModel.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 26.12.22.
//

import Foundation
import UIKit

class NoteModel {
    
    var note: Note
    var fontList: [FontItem]
    var sizeList: [SizeItem]
    
    init(note: Note = Constants.defaultNote,
         fontList: [FontItem] = Constants.defaultListOfFonts,
         sizeList: [SizeItem] = Constants.defaultListOfSizes) {
        self.note = note
        self.fontList = fontList
        self.sizeList = sizeList
    }
}

extension NoteModel {
    
    private struct Constants {
        static let defaultNote = Note(noteItem: NoteItem(id: UUID(), noteTitle: "", note: ""), noteFont: NoteFont())
        static let defaultListOfFonts = [FontItem(name: "Courier New", value: UIFont(name: "Courier New", size: 10)!),
                                         FontItem(name: "System", value: UIFont.systemFont(ofSize: 10)),
                                         FontItem(name: "Georgia", value: UIFont(name: "Georgia", size: 10)!)]
        static let defaultListOfSizes = [SizeItem(name: "Tiny", value: 10),
                                         SizeItem(name: "Normal", value: 14),
                                         SizeItem(name: "Huge", value: 20)]
    }
    
}
