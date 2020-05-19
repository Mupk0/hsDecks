//
//  ObservableType.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 06.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxCocoa
import RxSwift

extension ObservableType {
    
    func asDriverComplete() -> SharedSequence<DriverSharingStrategy, Element> {
        return asDriver(onErrorRecover: { (error)  in
            return Driver.empty()
        })
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
