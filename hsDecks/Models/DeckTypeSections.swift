//
//  DeckTypeSections.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 11.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

enum DeckTypeSections {
    case AllDecks
    case ByClass
    case Unknown
    
    init (id: Int) {
        switch id {
        case 0:
            self = .AllDecks
        case 1:
            self = .ByClass
        default:
            self = .Unknown
        }
    }

    
    static let allValues = [DeckTypeSections.AllDecks, DeckTypeSections.ByClass]
}

extension DeckTypeSections {
    var name: String {
        switch self {
        case .AllDecks:
            return "All Decks"
        case .ByClass:
            return "ByClass"
        case .Unknown:
            return "Unknown"
        }
    }

    var vc: UIViewController {
        switch self {
        case .AllDecks:
            return DeckListViewController(viewModel: DeckListViewModel())
        case .ByClass:
            return ClassSelectViewController()
        case .Unknown:
            return UIViewController()
        }
    }
}
