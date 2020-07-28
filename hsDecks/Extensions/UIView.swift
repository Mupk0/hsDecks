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
    
    func setDetailHeader(deckClass: CardClass) {
        let heroImage = UIImage(named: "\(deckClass.rawValue)_portrait")
        let heroImageView = UIImageView(image: heroImage)
        heroImageView.contentMode = .scaleAspectFill
        addSubview(heroImageView)
        
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.topAnchor.constraint(equalTo: topAnchor, constant: 23).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        let image = UIImage(named: "deckbuilder_frame_top_standard_desktop")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
