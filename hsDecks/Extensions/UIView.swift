//
//  UIView.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 28.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

extension UIView {
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor) {
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setDetailHeader(deckHeader: DeckHeader) {
        
        let deckListTopImage = UIImage(named: "deckListTopNoShadowFinal")
        let deckListTopImageView = UIImageView(image: deckListTopImage)
        deckListTopImageView.contentMode = .scaleAspectFit
        
        let heroImage = UIImage(named: "\(deckHeader.deckClass.rawValue)_portrait")
        let heroImageView = UIImageView(image: heroImage)
        
        let image = UIImage(named: "deckbuilder_frame_top_standard_desktop")
        let imageView = UIImageView(image: image)
        
        let deckNameLabel = UILabel.makeForCardLabel(size: 16, color: .white)
        deckNameLabel.text = deckHeader.deckName
        
        addSubview(deckListTopImageView)
        addSubview(heroImageView)
        addSubview(imageView)
        addSubview(deckNameLabel)
        
        deckListTopImageView.translatesAutoresizingMaskIntoConstraints = false
        deckListTopImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deckListTopImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        deckListTopImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        deckListTopImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 23).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -18).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -25).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19).isActive = true
        
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10).isActive = true
        deckNameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30).isActive = true
        deckNameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 40).isActive = true
        deckNameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40).isActive = true
        
        heroImageView.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleToFill
    }
}
