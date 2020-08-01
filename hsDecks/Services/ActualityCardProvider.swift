//
//  ActualityCardProvider.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 31.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import Foundation

class ActualityCardProvider {
    
    static var shared = ActualityCardProvider()
    
    func checkCardActuality() {
        
        let latestUrl = URL(string: Constants.latestDirectoryUrl)!
        
        URLSession.shared.dataTask(with: latestUrl) { [weak self] data, response, error in
            if let error = error { print(error.localizedDescription); return }
            guard let _ = data, let response = response else { return }
            
            var resp = response.url?.absoluteString ?? ""
            resp.removeLast()
            let result = resp.components(separatedBy: ["/"])
            
            if let stringVersion = result.last, let actualVersion = Int(stringVersion) {
                let savedCardsVersion = UserDefaults.standard.value(forKey: "hsCardsVersion") as? Int
                if savedCardsVersion == nil || savedCardsVersion ?? 0 < actualVersion {
                    self?.loadCardsDataAndSave(version: actualVersion)
                }
            }
        }.resume()
    }
    
    private func loadCardsDataAndSave(version: Int) {
        
        let cardsDataURL = URL(string: Constants.latestCardDataUrl)!
        
        URLSession.shared.dataTask(with: cardsDataURL) { data, response, error in
            if let error = error { print(error.localizedDescription); return }
            guard let data = data, let _ = response else { return }
            
            DiskProvider.saveCardData(data: data)
            UserDefaults.standard.set(version, forKey: "hsCardsVersion")
        }.resume()
    }
}
