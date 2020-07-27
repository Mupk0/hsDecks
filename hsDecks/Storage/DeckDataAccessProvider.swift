//
//  DeckDataAccessProvider.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 06.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import CoreData
import RxSwift
import RxRelay

class DeckDataAccessProvider {
    
    private var decksFromCoreData = BehaviorRelay<[Deck]>(value: [])
    private var classDecksCounter = BehaviorRelay<Int>(value: 0)
    private var managedObjectContext: NSManagedObjectContext
    
    private let disposeBag = DisposeBag()
    
    init() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = delegate.persistentContainer.viewContext
        
        decksFromCoreData.accept(fetchData())
    }
    
    // MARK: - fetching Decks from Core Data and update observable todos
    private func fetchData() -> [Deck] {
        let decksFetchRequest = Deck.decksFetchRequest()
        decksFetchRequest.returnsObjectsAsFaults = false
        
        do {
            return try managedObjectContext.fetch(decksFetchRequest)
        } catch {
            return []
        }
    }
    // MARK: - return observable Deck
    public func fetchObservableData() -> Observable<[Deck]> {
        decksFromCoreData.accept(fetchData())
        return decksFromCoreData.asObservable()
    }
    // MARK: - return Class Deck Counter
    public func fetchDeckClassCounter(cardClass: CardClass) -> Int {
        let decksFetchRequest = Deck.decksFetchRequest()
        let classString = cardClass.description
        decksFetchRequest.predicate = NSPredicate(format: "deckClass == %@",
                                                  classString)
        
        do {
            return try managedObjectContext.count(for: decksFetchRequest)
        } catch {
            return 0
        }
    }
    // MARK: - add new Deck from Core Data
    public func addDeck(deckCode: String, deckName: String, deckClass: String) {
        let newDeck = NSEntityDescription.insertNewObject(forEntityName: "Deck", into: managedObjectContext) as! Deck
        
        newDeck.name = deckName
        newDeck.deckCode = deckCode
        newDeck.date = Date()
        newDeck.deckClass = deckClass
        
        do {
            try managedObjectContext.save()
            decksFromCoreData.accept(fetchData())
        } catch {
            fatalError("error saving data")
        }
    }
    // MARK: - remove specified Deck from Core Data
    public func removeDeck(withIndex index: Int) {
        managedObjectContext.delete(decksFromCoreData.value[index])
        
        do {
            try managedObjectContext.save()
            decksFromCoreData.accept(fetchData())
        } catch {
            fatalError("error delete data")
        }
    }
    
}
