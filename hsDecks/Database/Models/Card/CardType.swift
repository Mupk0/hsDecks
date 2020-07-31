//
//  CardType.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

enum CardType: Int, CaseIterable {
    case invalid = 0,
    game = 1,
    player = 2,
    hero = 3,
    minion = 4,
    spell = 5,
    enchantment = 6,
    weapon = 7,
    item = 8,
    token = 9,
    hero_power = 10
}
