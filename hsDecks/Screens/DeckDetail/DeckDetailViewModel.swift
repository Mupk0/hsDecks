//
//  DeckDetailViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

protocol DeckDetailViewModelType {
    var navigationTitle: Observable<String> { get }
    var deck: Observable<[Card]> { get }
    var deckClass: Observable<CardClass> { get }
}

class DeckDetailViewModel: DeckDetailViewModelType {

    var navigationTitle: Observable<String>
    var deck: Observable<[Card]>
    var deckClass: Observable<CardClass>
    
    private let disposeBag = DisposeBag()
    
    init(deckCode: String) {
        if let serializeDeck = DeckSerializer.deserialize(input: deckCode) {
            let cards = serializeDeck.cards
            
            //let sortedCards = cards.sortCardForSections()
            let deckCost = cards.getDeckCost()
            
            self.deck = Observable.just(cards)
            self.deckClass = Observable.just(serializeDeck.playerClass)
            self.navigationTitle = Observable.just(String(deckCost))
        } else {
            self.deck = Observable.just([])
            self.deckClass = Observable.just(CardClass.neutral)
            self.navigationTitle = Observable.just("")
        }
    }
}
