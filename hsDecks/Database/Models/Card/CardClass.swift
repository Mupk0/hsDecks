//
//  CardClass.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

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
    demonHunter = "HERO_10"
    
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
            self = .demonHunter
        default:
            self = .neutral
        }
    }
    
    static let allValues = [.druid, .hunter, .mage, paladin, .priest, .rogue, shaman, .warlock, .warrior, .demonHunter]
    
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
        case .demonHunter:
            return "Demon Hunter"
        }
    }
    
    var portraitImage: UIImage {
        switch self {
        case .neutral:
            return UIImage()
        case .druid:
            return #imageLiteral(resourceName: "HERO_06_portrait")
        case .hunter:
            return #imageLiteral(resourceName: "HERO_05_portrait")
        case .mage:
            return #imageLiteral(resourceName: "HERO_08_portrait")
        case .paladin:
            return #imageLiteral(resourceName: "HERO_04_portrait")
        case .priest:
            return #imageLiteral(resourceName: "HERO_09_portrait")
        case .rogue:
            return #imageLiteral(resourceName: "HERO_03_portrait")
        case .shaman:
            return #imageLiteral(resourceName: "HERO_02_portrait")
        case .warlock:
            return #imageLiteral(resourceName: "HERO_07_portrait")
        case .warrior:
            return #imageLiteral(resourceName: "HERO_01_portrait")
        case .demonHunter:
            return #imageLiteral(resourceName: "HERO_10_portrait")
        }
    }
}
