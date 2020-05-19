//
//  CardsEncoder.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 03.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

var allCards: [Card] = []

class CardsEncoder {
    
    static func loadCards() {
        let url = Bundle.main.url(forResource: "cards", withExtension: "json")
        guard let jsonData = url else { return }
        
        guard let data = try? Data(contentsOf: jsonData) else { return }
        do {
            let cardsData = try JSONDecoder().decode([Card].self, from: data)
            allCards = cardsData
        } catch {
            print(error)
        }
    }
}
