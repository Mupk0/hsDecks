//
//  CardClass.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

enum CardClass: String {
    case neutral = "",
    druid = "HERO_06",
    hunter = "HERO_05",
    mage = "HERO_08",
    paladin = "HERO_04",
    priest = "HERO_09",
    rogue = "HERO_03",
    shaman = "HERO_02",
    warlock = "HERO_07",
    warrior = "HERO_01",
    demonhunter = "HERO_10"
    
    static let allValues = [.druid, .hunter, .mage, paladin, .priest, .rogue, shaman, .warlock, .warrior, .demonhunter]
    
    init (id: Int) {
        switch id {
        case 0:
            self = .druid
        case 1:
            self = .hunter
        case 2:
            self = .mage
        case 3:
            self = .paladin
        case 4:
            self = .priest
        case 5:
            self = .rogue
        case 6:
            self = .shaman
        case 7:
            self = .warlock
        case 8:
            self = .warrior
        case 9:
            self = .demonhunter
        default:
            self = .neutral
        }
    }
    
    var description: String {
        switch self {
        case .neutral:
            return "Neutral"
        case .druid:
            return "Druid"
        case .hunter:
            return "Hunter"
        case .mage:
            return "Mage"
        case .paladin:
            return "Paladin"
        case .priest:
            return "Priest"
        case .rogue:
            return "Rogue"
        case .shaman:
            return "Shaman"
        case .warlock:
            return "Warlock"
        case .warrior:
            return "Warrior"
        case .demonhunter:
            return "Demonhunter"
        }
    }
}
