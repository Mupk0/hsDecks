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
    
    private let deckListTopImageView = UIImageView()
    private let deckListBottomImageView = UIImageView()
    private let heroImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: 131))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetailHeader(_ deckHeader: DeckHeaderModel) {
        
        deckNameLabel.text = deckHeader.deckName
        
        addSubview(deckListTopImageView)
        addSubview(heroImageView)
        addSubview(deckListBottomImageView)
        addSubview(deckNameLabel)
        
        let heroImage = UIImage(named: "\(deckHeader.deckClass.rawValue)_portrait")
        let deckListTopImage = UIImage(named: "deckListTopNoShadowFinal")
        let deckListBottomImage = UIImage(named: "deckbuilder_frame_top_standard_desktop")
        
        deckListBottomImageView.image = deckListBottomImage
        deckListTopImageView.image = deckListTopImage
        heroImageView.image = heroImage
        
        deckListTopImageView.translatesAutoresizingMaskIntoConstraints = false
        deckListTopImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deckListTopImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        deckListTopImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        deckListTopImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.topAnchor.constraint(equalTo: deckListBottomImageView.topAnchor, constant: 23).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: deckListBottomImageView.bottomAnchor, constant: -18).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: deckListBottomImageView.leadingAnchor, constant: 20).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: deckListBottomImageView.trailingAnchor, constant: -25).isActive = true
        
        deckListBottomImageView.translatesAutoresizingMaskIntoConstraints = false
        deckListBottomImageView.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        deckListBottomImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
        deckListBottomImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19).isActive = true
        deckListBottomImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19).isActive = true
        
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.topAnchor.constraint(equalTo: deckListBottomImageView.topAnchor, constant: 10).isActive = true
        deckNameLabel.bottomAnchor.constraint(equalTo: deckListBottomImageView.bottomAnchor, constant: -30).isActive = true
        deckNameLabel.leadingAnchor.constraint(equalTo: deckListBottomImageView.leadingAnchor, constant: 40).isActive = true
        deckNameLabel.trailingAnchor.constraint(equalTo: deckListBottomImageView.trailingAnchor, constant: 40).isActive = true
        
        deckListBottomImageView.contentMode = .scaleToFill
        deckListTopImageView.contentMode = .scaleAspectFit
        heroImageView.contentMode = .scaleAspectFill
    }
}
