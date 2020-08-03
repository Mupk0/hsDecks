//
//  DeckDetailSectionHeaderView.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 31.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class DeckDetailSectionHeaderView: UIView {
    
    private let deckNameLabel = UILabel.makeForCardLabel(size: 16,
                                                         color: .white)
    
    private let deckListTopImageView = UIImageView(image: #imageLiteral(resourceName: "deck_detail_top_frame"))
    private let heroImageView = UIImageView()
    
    private let topImageRation: CGFloat = 2.859154929577465
    
    override init(frame: CGRect) {
        let width = UIScreen.main.bounds.width
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: width,
                                 height: width / topImageRation))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetailHeader(_ deckHeader: DeckHeaderModel) {
        
        deckNameLabel.text = deckHeader.deckName
        heroImageView.image = deckHeader.deckClass.portraitImage
        
        addSubview(heroImageView)
        addSubview(deckListTopImageView)
        addSubview(deckNameLabel)
        
        deckListTopImageView.translatesAutoresizingMaskIntoConstraints = false
        deckListTopImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deckListTopImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        deckListTopImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        deckListTopImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 35).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -33).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 33).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -33).isActive = true
        
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 21).isActive = true
        deckNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -48).isActive = true
        deckNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 59).isActive = true
        deckNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: 59).isActive = true

        deckListTopImageView.contentMode = .scaleAspectFit
        heroImageView.contentMode = .scaleAspectFill
    }
}
