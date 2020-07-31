//
//  DeckDetailTableViewCellViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 06.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxCocoa
import RxSwift

class DeckDetailTableViewCellViewModel {
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let name: Driver<String>
        let cost: Driver<String>
        let count: Driver<String>
        let tileImage: Driver<String>
        let rarityColor: Driver<UIColor>
    }
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    func transform(input: Input) -> Output {
        let name: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                return Driver.just(self.card.name)
        }
        
        let cost: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let cost = self.card.cost else {return Driver.empty()}
                let costToString = String(cost)
                return Driver.just(costToString)
        }
        
        let count: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let count = self.card.count else {return Driver.empty()}
                let countToString = String(count)
                return Driver.just(countToString)
        }
        
        let tileImage: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                guard let id = self.card.id else {return Driver.empty()}
                return Driver.just(id)
        }
        
        let rarityColor: Driver<UIColor> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let rarity = self.card.rarity, let rarityColor = Rarity(rawValue: rarity)?.color else {return Driver.empty()}
                return Driver.just(rarityColor)
        }
        
        return Output(name: name, cost: cost, count: count, tileImage: tileImage, rarityColor: rarityColor)
    }
}
