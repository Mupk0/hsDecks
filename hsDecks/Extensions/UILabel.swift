//
//  UILabel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

extension UILabel {
    static func makeForCardLabel(size: CGFloat = 20,
                                 color: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.font = Font.belwe(size: size).font
        label.textColor = color
        
        return label
    }
}
