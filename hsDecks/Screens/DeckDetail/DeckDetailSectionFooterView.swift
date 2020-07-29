//
//  DeckDetailSectionFooterView.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 29.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class DeckDetailSectionFooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero,
                                 size: CGSize(width: UIScreen.main.bounds.width, height: 29)))
        
        let sectionBottomImage = UIImage(named: "deckListSectionBottom") ?? UIImage()
        let sectionBottomImageVIew = UIImageView(image: sectionBottomImage)
        
        addSubview(sectionBottomImageVIew)

        sectionBottomImageVIew.translatesAutoresizingMaskIntoConstraints = false
        sectionBottomImageVIew.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sectionBottomImageVIew.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sectionBottomImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sectionBottomImageVIew.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
