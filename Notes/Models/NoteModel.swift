//
//  NoteModel.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 26.12.22.
//

import Foundation
import UIKit

class NoteModel {

    struct Constants {
        static let defaultFont = FontItem(name: "System", value: UIFont.systemFont(ofSize: 14))
        static let defaultSize = SizeItem(name: "Normal", value: 14)
        static let defaultListOfFonts = [FontItem(name: "System", value: UIFont.systemFont(ofSize: 14)),
                                         FontItem(name: "Custom", value: UIFont.boldSystemFont(ofSize: 14)),
                                         FontItem(name: "Cool", value: UIFont.italicSystemFont(ofSize: 14))]
        static let defaultListOfSizes = [SizeItem(name: "Tiny", value: 10),
                                         SizeItem(name: "Normal", value: 14),
                                         SizeItem(name: "Huge", value: 20)]
    }
    
    var note: NoteItem?
    var selectedFont: FontItem
    var selectedSize: SizeItem
    
    var fontList: [FontItem]
    var sizeList: [SizeItem]
    
    init(note: NoteItem? = nil,
         selectedFont: FontItem = Constants.defaultFont,
         selectedSize: SizeItem = Constants.defaultSize,
         fontList: [FontItem] = Constants.defaultListOfFonts,
         sizeList: [SizeItem] = Constants.defaultListOfSizes) {
        self.note = note
        self.selectedFont = selectedFont
        self.selectedSize = selectedSize
        self.fontList = fontList
        self.sizeList = sizeList
    }
}
