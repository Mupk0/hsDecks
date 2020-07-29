//
//  DeckDetailViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

struct DeckHeader {
    var deckClass: CardClass
    let deckName: String
}

protocol DeckDetailViewModelType {
    var navigationTitle: Observable<String> { get }
    var cards: Observable<[Card]> { get }
    var deckHeader: Observable<DeckHeader> { get }
}

class DeckDetailViewModel: DeckDetailViewModelType {

    var navigationTitle: Observable<String>
    var cards: Observable<[Card]>
    var deckHeader: Observable<DeckHeader>
    
    private let disposeBag = DisposeBag()
    
    init(deck: Deck) {
        if let deckCode = deck.deckCode,
            let serializeDeck = DeckSerializer.deserialize(input: deckCode) {
            let cards = serializeDeck.cards
            
            //let sortedCards = cards.sortCardForSections()
            let deckCost = cards.getDeckCost()
            let deckClass = serializeDeck.playerClass
            let deckHeader = DeckHeader(deckClass: deckClass,
                                        deckName: deck.name ?? "Standart \(deckClass.description) deck")
            
            self.cards = Observable.just(cards)
            self.deckHeader = Observable.just(deckHeader)
            self.navigationTitle = Observable.just(String(deckCost))
        } else {
            self.cards = Observable.just([])
            self.deckHeader = Observable.just(DeckHeader(deckClass: CardClass.neutral,
                                                        deckName: ""))
            self.navigationTitle = Observable.just("")
        }
    }
}
