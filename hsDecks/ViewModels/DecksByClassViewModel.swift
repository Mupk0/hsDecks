//
//  DecksByClassViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 12.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DecksByClassViewModel {
    
    private var deckList = BehaviorRelay<[Deck]>(value: [])
    private var deckDataAccessProvider = DeckDataAccessProvider()
    
    private let disposeBag = DisposeBag()
    
    init(deckClass: String) {
        fetchDeckListAndUpdateObservableDecks(deckClass: deckClass)
    }
    
    public func getDecks() -> Observable<[Deck]> {
        return deckList.asObservable()
    }
    // MARK: - fetching Decks from Core Data and update observable todos
    private func fetchDeckListAndUpdateObservableDecks(deckClass: String) {
        deckDataAccessProvider.fetchObservableData()
            .map({ $0.filter({ $0.deckClass == deckClass }) })
            .subscribe(onNext : { [weak self] deckList in
                self?.deckList.accept(deckList)
            })
            .disposed(by: disposeBag)
    }
    // MARK: - remove specified Deck from Core Data
    public func removeDeck(withIndex index: Int) {
        deckDataAccessProvider.removeDeck(withIndex: index)
    }
}
