//
//  DeckListTableViewCellViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 06.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxCocoa
import RxSwift

class DeckListTableViewCellViewModel {
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let name: Driver<String>
    }
    
    let viewModel: Deck
    
    init(_ viewModel: Deck) {
        self.viewModel = viewModel
    }

    func transform(input: Input) -> Output {
        let name: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let name = self.viewModel.name else {return Driver.empty()}
                //let deckClass = self.viewModel.deckClass
                return Driver.just(name)
            }
        
        return Output(name: name)
    }
}
