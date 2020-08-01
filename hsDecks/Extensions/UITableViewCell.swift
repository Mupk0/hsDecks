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
