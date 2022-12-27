//
//  NoteFont.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 27.12.22.
//

import UIKit

struct NoteFont {
    var font: UIFont = UIFont.systemFont(ofSize: 14)
    var size: CGFloat = 14
    var isBold: Bool = false
    var isCursive: Bool = false
    
    var completeFont: UIFont {
        let font = font.withSize(size)
        switch (isBold, isCursive) {
        case (true, true):
            return font.boldAndItalic()
        case (true, false):
            return font.bold()
        case (false, true):
            return font.italic()
        case (false, false):
            return font
        }
    }
}
