//
//  DiskProvider.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 31.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

class DiskProvider {
    
    static func saveCardData(data: Data) {
        do {
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let itemDirectoryUrl = documentsURL.appendingPathComponent("hsData")
            
            do {
                try fileManager.createDirectory(at: itemDirectoryUrl,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } catch {
                #if DEBUG
                print("Ooops! Something went wrong: \(error.localizedDescription)")
                #endif
            }
            
            let fileURL = itemDirectoryUrl.appendingPathComponent("cards.json")
            
            fileManager.createFile(atPath: fileURL.absoluteString, contents: nil, attributes: nil)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
    }
    
    static func getCardData() -> [Card] {
        var cards: [Card] = []
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let itemDirectoryUrl = documentsURL.appendingPathComponent("hsData/cards.json")
        
        do {
            let cardsData = try Data(contentsOf: itemDirectoryUrl)
            cards = try JSONDecoder().decode([Card].self, from: cardsData)
            
        } catch {
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
        
        return cards
    }
}
