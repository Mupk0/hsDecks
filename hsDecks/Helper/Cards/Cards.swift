//
//  Cards.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

final class Cards {
    
    static var cards = allCards
    
    static func hero(byId cardId: String) -> Card? {
        if let card = cards.first(where: { $0.id == cardId }) {
            return card
        }
        return nil
    }
    
    static func by(dbfId: Int?, collectible: Bool = true) -> Card? {
        guard let dbfId = dbfId else { return nil }
        
        if let card = cards.first(where: { $0.dbfId == dbfId }) {
            return card
        }
        return nil
    }
    
    static func any(byId cardId: String) -> Card? {
        guard !cardId.isBlank else { return nil }
        
        if let card = cards.first(where: { $0.id == cardId }) {
            return card
        }
        return nil
    }
}
