//
//  DeckListViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 05.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DeckListViewModel {
    
    private var deckList = BehaviorRelay<[Deck]>(value: [])
    private var deckDataAccessProvider = DeckDataAccessProvider()
    
    private let disposeBag = DisposeBag()
    
    init() {
        fetchDeckListAndUpdateObservableDecks()
    }
    
    public func getDecks() -> Observable<[Deck]> {
        return deckList.asObservable()
    }
    // MARK: - fetching Decks from Core Data and update observable todos
    private func fetchDeckListAndUpdateObservableDecks() {
        deckDataAccessProvider.fetchObservableData()
            .map({ $0 })
            .subscribe(onNext : { [weak self] deckList in
                self?.deckList.accept(deckList)
            })
            .disposed(by: disposeBag)
    }
    // MARK: - add new Deck from Core Data
    public func addDeck(deckCode: String, deckName: String, deckClass: String) {
        deckDataAccessProvider.addDeck(deckCode: deckCode, deckName: deckName, deckClass: deckClass)
    }
    // MARK: - remove specified Deck from Core Data
    public func removeDeck(withIndex index: Int) {
        deckDataAccessProvider.removeDeck(withIndex: index)
    }
}
