//
//  ClassSelectTableViewCellViewModel.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 27.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxCocoa
import RxSwift

class ClassSelectTableViewCellViewModel {
    
    private var deckDataAccessProvider = DeckDataAccessProvider()
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let classDescription: Driver<String>
        let counter: Driver<String>
        //let classImage: Driver<UIImage>
    }
    
    let cardClass: CardClass
    
    init(_ cardClass: CardClass) {
        self.cardClass = cardClass
    }
    
    func transform(input: Input) -> Output {
        let classDescription: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                return Driver.just(self.cardClass.description)
        }
        
        let counter: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                let cardClass = self.cardClass
                let cardCounter = self.deckDataAccessProvider.fetchDeckClassCounter(cardClass: cardClass)
                return Driver.just(String(cardCounter))
        }
        
        //        let classImage: Driver<UIImage> = input.trigger
        //            .flatMapLatest { [weak self] (_) in
        //                guard let self = self else {return Driver.empty()}
        //                guard let id = self.viewModel.id, let image = UIImage(named: "\(id)") else {return Driver.empty()}
        //                return Driver.just(image)
        //            }
        
        return Output(classDescription: classDescription,
                      counter: counter)
    }
}
