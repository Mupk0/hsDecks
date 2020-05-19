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
        let tileImage: Driver<UIImage>
    }
    
    let viewModel: Card
    
    init(_ viewModel: Card) {
        self.viewModel = viewModel
    }

    func transform(input: Input) -> Output {
        let name: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                return Driver.just(self.viewModel.name)
            }
        
        let cost: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let cost = self.viewModel.cost else {return Driver.empty()}
                let costToString = String(cost)
                return Driver.just(costToString)
            }
        
        let count: Driver<String> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self, let count = self.viewModel.count else {return Driver.empty()}
                let countToString = String(count)
                return Driver.just(countToString)
            }
        
        let tileImage: Driver<UIImage> = input.trigger
            .flatMapLatest { [weak self] (_) in
                guard let self = self else {return Driver.empty()}
                guard let id = self.viewModel.id, let image = UIImage(named: "\(id)") else {return Driver.empty()}
                return Driver.just(image)
            }
        
        return Output(name: name, cost: cost, count: count, tileImage: tileImage)
    }
}
