//
//  ViewConfiguration.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 10.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    func buildViewHierarchy()
    func configureViews()
    func setupConstraints()
    func setupViewConfiguration()
    func bindViewModel()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
        bindViewModel()
    }
}
