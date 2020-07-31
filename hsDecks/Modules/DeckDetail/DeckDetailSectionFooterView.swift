//
//  DeckDetailSectionFooterView.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 29.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class DeckDetailSectionFooterView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let sectionBottomImageVIew = UIImageView(image: #imageLiteral(resourceName: "deckListSectionBottom"))
        
        addSubview(sectionBottomImageVIew)
        
        sectionBottomImageVIew.translatesAutoresizingMaskIntoConstraints = false
        sectionBottomImageVIew.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sectionBottomImageVIew.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sectionBottomImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sectionBottomImageVIew.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
