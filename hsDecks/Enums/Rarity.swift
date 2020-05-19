//
//  Rarity.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

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
}
