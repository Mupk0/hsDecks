//
//  DeckSerializer.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

class DeckSerializer {
    enum DeckSerializerError: Error {
        case argumentError
    }
    
    class func deserialize(input: String) -> SerializedDeck? {
        guard let deckString = input.components(separatedBy: .whitespacesAndNewlines).last else { return nil }
        
        var playerClass: CardClass?
        var cards: [Card]?
        
        if let (_cardClass, _cards) = deserializeDeckString(deckString: deckString) {
            playerClass = _cardClass
            cards = _cards
        }
        
        guard let _playerClass = playerClass, let _cards = cards else { return nil }
        
        return SerializedDeck(playerClass: _playerClass,
                              cards: _cards)
    }
    
    class func deserializeDeckString(deckString: String) -> (CardClass, [Card])? {
        guard let data = Data(base64Encoded: deckString) else {
            print("Can not decode \(deckString)")
            return nil
        }
        
        var bytes = [UInt8](data)
        
        var offset = 0
        @discardableResult func read() throws -> Varint {
            if offset > bytes.count {
                throw DeckSerializerError.argumentError
            }
            guard let value = Varint.VarintFromBytes(Array(bytes[offset..<bytes.count])) else {
                throw DeckSerializerError.argumentError
            }
            offset += value.count
            return value
        }
        
        // Zero byte
        offset += 1
        
        // Version - currently unused, always 1
        _ = try? read()
        
        // Format - determined dynamically
        _ = try? read()
        
        // Num Heroes - always 1
        _ = try? read()
        
        guard let heroId = try? read() else {
            print("Can not get heroId")
            return nil
        }
        guard let heroCard = Cards.by(dbfId: Int(heroId.toInt64()), collectible: false) else {
            print("Can not get heroCard")
            return nil
        }
        let cardClass = CardClass(rawValue: heroCard.id ?? "") ?? CardClass.neutral
        //print("Got class \(cardClass)")
        
        var cards: [Card] = []
        func addCard(dbfId: Varint? = nil, count: Int = 1) {
            let dbfId = dbfId ?? (try? read())
            guard let id = dbfId,
                let card = Cards.by(dbfId: Int(id.toInt64())) else {
                    print("Can not get card")
                    return
            }
            //print("You Deck got \(count) card \(String(describing: card.name))")
            card.count = count
            cards.append(card)
        }
        
        let numSingleCards = Int((try? read())?.toUInt64() ?? 0)
        //print("numSingleCards : \(numSingleCards)")
        for _ in 0..<numSingleCards {
            addCard()
        }
        
        let numDoubleCards = Int((try? read())?.toUInt64() ?? 0)
        //print("numDoubleCards : \(numDoubleCards)")
        for _ in 0..<numDoubleCards {
            addCard(count: 2)
        }
        
        let numMultiCards = Int((try? read())?.toUInt64() ?? 0)
        //print("numMultiCards : \(numMultiCards)")
        for _ in 0..<numMultiCards {
            let dbfId = try? read()
            let count = Int((try? read())?.toInt64() ?? 1)
            addCard(dbfId: dbfId, count: count)
        }
        
        return (cardClass, cards.sortCardList())
    }
}
