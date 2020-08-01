//
//  OutlineText.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 01.08.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class OutlineText {
    
    static func setAttributedString(string: String,
                                    font: UIFont,
                                    outlineSize: Float,
                                    textColor: UIColor,
                                    outlineColor: UIColor) -> NSMutableAttributedString {
        
        let attributes = setAttributes(font: font,
                                       outlineSize: outlineSize,
                                       textColor: textColor,
                                       outlineColor: outlineColor)
        
        return NSMutableAttributedString(string:string,
                                         attributes: attributes)
    }
    
    static func setAttributes(font: UIFont,
                              outlineSize: Float,
                              textColor: UIColor,
                              outlineColor: UIColor) -> [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.strokeColor: outlineColor,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.strokeWidth: -outlineSize,
            NSAttributedString.Key.font: font
            ] as [NSAttributedString.Key : Any]
    }
}
