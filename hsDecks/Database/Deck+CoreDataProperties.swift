//
//  Deck+CoreDataProperties.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 06.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import CoreData

extension Deck {

    @nonobjc public class func decksFetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var name: String?
    @NSManaged public var deckCode: String?
    @NSManaged public var deckClass: String?
    @NSManaged public var date: Date?
}
