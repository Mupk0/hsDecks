//
//  DeckDetailViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

protocol DeckDetailViewModelType {
    var navigationTitle: Observable<String> { get }
    var deck: Observable<[SectionModel<String, Card>]> { get }
}

class DeckDetailViewModel: DeckDetailViewModelType {

    var navigationTitle: Observable<String>
    var deck: Observable<[SectionModel<String, Card>]>
    
    private let disposeBag = DisposeBag()
    
    init(deckCode: String) {
        if let serializeDeck = DeckSerializer.deserialize(input: deckCode) {
            let cards = serializeDeck.cards
            
            let sortedCards = cards.sortCardForSections()
            let deckCost = cards.getDeckCost()
            
            self.deck = Observable.just(sortedCards)
            self.navigationTitle = Observable.just(String(deckCost))
        } else {
            self.deck = Observable.just([])
            self.navigationTitle = Observable.just("")
        }
    }
}
