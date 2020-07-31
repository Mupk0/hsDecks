//
//  Rarity.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

enum Rarity: String, CaseIterable {
    case free = "FREE",
    common = "COMMON",
    rare = "RARE",
    epic = "EPIC",
    legendary = "LEGENDARY"
    
    var dastCost: Int {
        switch self {
        case .free:
            return 0
        case .common:
            return 40
        case .rare:
            return 100
        case .epic:
            return 400
        case .legendary:
            return 1600
        }
    }
    
    var color: UIColor {
        switch self {
        case .free:
            return UIColor(red: 0.73, green: 0.58, blue: 0.38, alpha: 1.00)
        case .common:
            return UIColor(red: 0.18, green: 0.80, blue: 0.44, alpha: 1.00)
        case .rare:
            return UIColor(red: 0.00, green: 0.44, blue: 0.87, alpha: 1.00)
        case .epic:
            return UIColor(red: 0.64, green: 0.21, blue: 0.93, alpha: 1.00)
        case .legendary:
            return UIColor(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.00)
        }
    }
}
