//
//  Array.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation
import RxDataSources

extension Array {
    func group<K: Hashable>(_ fn: (Element) -> K) -> [K: [Element]] {
        return Dictionary(grouping: self, by: fn) as [K: [Element]]
    }
    
    func any(_ fn: (Element) -> Bool) -> Bool {
        return filter(fn).count > 0
    }
    
    func all(_ fn: (Element) -> Bool) -> Bool {
        return filter(fn).count == count
    }
    
    func take(_ count: Int) -> [Element] {
        return Array(prefix(count))
    }
}

extension Array where Element: Card {
    func sortCardList() -> [Card] {
        return sorted {
            if let first = $0.cost, let second = $1.cost {
                return first < second
            }
            return $0.name < $1.name
        }
    }
    
    func getDeckCost() -> Int {
        var deckCost = 0
        for card in self {
            if let cardRarity = card.rarity {
                deckCost += Rarity(rawValue: cardRarity)?.dastCost ?? 0
            }
        }
        return deckCost
    }
    
    func sortCardForSections() -> [SectionModel<String, Card>] {
        var classCards = [Card]()
        var neutralCards = [Card]()
        var classCardsCount = 0
        var neutralCardsCount = 0
        for card in self {
            if (card.cardClass == "NEUTRAL") {
                neutralCards.append(card)
                neutralCardsCount += card.count ?? 1
            } else {
                classCards.append(card)
                classCardsCount += card.count ?? 1
            }
        }
        return [
            SectionModel(model: "Class Cards (\(classCardsCount))",
                items: classCards),
            SectionModel(model: "Neutral Cards (\(neutralCardsCount))",
                items: neutralCards)
        ]
    }
}

extension Array where Element: Equatable {
    mutating func remove(_ element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        return filter { alreadyAdded.insert($0).inserted }
    }
}
