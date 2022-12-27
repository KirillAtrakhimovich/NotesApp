//
//  UIFont+TextStyle.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 27.12.22.
//

import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
    
    func boldAndItalic() -> UIFont {
        return withTraits(traits: [.traitItalic, .traitBold])
    }
}
