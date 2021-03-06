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
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setBackgroundParchment() {
        self.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "parchment"))
    }
    
    func roundCorners(size: CGSize,
                      corners: UIRectCorner,
                      radius: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0,
                                                    y: 0,
                                                    width: size.width,
                                                    height: size.height),
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
