//
//  Array.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

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
