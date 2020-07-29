//
//  Font.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 29.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

protocol FontItem {
    var font: UIFont { get }
}

enum Font {
    case belwe(size:CGFloat)
}

extension Font: FontItem {
    var font: UIFont {
        switch self {
        case .belwe(let size):
            return UIFont(name:"BelweBdBTRusbyme-Bold", size: size) ?? .systemFont(ofSize: size)
        }
    }
}

