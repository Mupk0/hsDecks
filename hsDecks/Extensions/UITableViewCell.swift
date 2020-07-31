//
//  UITableViewCell.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 28.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func addSeparator() {
        let additionalSeparatorThickness = CGFloat(3)
        let separator = CALayer()
        separator.backgroundColor = UIColor.white.cgColor
        separator.frame = CGRect(x: 0,
                                 y: self.frame.size.height - additionalSeparatorThickness,
                                 width: self.frame.size.width,
                                 height: additionalSeparatorThickness)
        self.layer.addSublayer(separator)
    }
}


extension UITableViewCell {
    func outline(string:String,
                 font:String,
                 size: CGFloat,
                 outlineSize:Float,
                 textColor: UIColor,
                 outlineColor:UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string:string,
                                         attributes: outlineAttributes(font: UIFont(name: font,
                                                                                    size: size)!,
                                                                       outlineSize: outlineSize,
                                                                       textColor: textColor,
                                                                       outlineColor: outlineColor))
    }
    
    private func outlineAttributes(font: UIFont,
                                   outlineSize: Float,
                                   textColor: UIColor,
                                   outlineColor: UIColor) -> [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.strokeColor : outlineColor,
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.strokeWidth : -outlineSize,
            NSAttributedString.Key.font : font
        ]
    }
}
