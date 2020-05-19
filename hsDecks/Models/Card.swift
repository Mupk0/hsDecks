//
//  Card.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

class Card: Codable {
    let artist: String?
    let cardClass: String?
    let collectible: Bool?
    let cost: Int?
    let dbfId: Int
    let flavor: String?
    let id: String?
    let name: String
    let rarity: String?
    let set: String?
    let text: String?
    let type: String?
    let mechanics: [String]?
    let attack: Int?
    let health: Int?
    let referencedTags: [String]?
    let race: String?
    let elite: Bool?
    let targetingArrowText: String?
    let durability: Int?
    let overload: Int?
    let spellDamage: Int?
    let battlegroundsPremiumDbfId: Int?
    let techLevel: Int?
    let armor: Int?
    let faction: String?
    var count: Int?
}

extension Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
