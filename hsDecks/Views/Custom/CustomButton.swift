//
//  CustomButton.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 02.08.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    let leftBorder = #imageLiteral(resourceName: "dropdown_left")
    let rightBorder = #imageLiteral(resourceName: "dropdown_right")
    let middleBorder = #imageLiteral(resourceName: "middle_button")
    //    let rightBorder = #imageLiteral(resourceName: "dropdown_right").withRenderingMode(.alwaysOriginal)

    let textLabel = UILabel.makeForCardLabel(size: 18,
                                             color: UIColor(red: 0.31,
                                                            green: 0.24,
                                                            blue: 0.12,
                                                            alpha: 1.00))
    
    init(text: String) {
        let size = text.size(using: Font.belwe(size: 18).font)
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: size.width + 30,
                                        height: 30))
        textLabel.text = text
        super.init(frame: frame)
        configureViews()
        return
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        let leftBorderView = UIImageView(image: leftBorder)
        let rightBorderView = UIImageView(image: rightBorder)
        let middleBorderView = UIImageView(image: middleBorder)

        addSubview(leftBorderView)
        addSubview(rightBorderView)
        addSubview(middleBorderView)
        middleBorderView.addSubview(textLabel)
        
        middleBorderView.translatesAutoresizingMaskIntoConstraints = false
        middleBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        middleBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        middleBorderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        middleBorderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        leftBorderView.translatesAutoresizingMaskIntoConstraints = false
        leftBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leftBorderView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        leftBorderView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        leftBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        rightBorderView.translatesAutoresizingMaskIntoConstraints = false
        rightBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightBorderView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rightBorderView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: middleBorderView.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: middleBorderView.bottomAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: middleBorderView.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: middleBorderView.trailingAnchor).isActive = true
        
        middleBorderView.contentMode = .scaleToFill
        
        leftBorderView.contentMode = .scaleAspectFill
        rightBorderView.contentMode = .scaleAspectFill
    }
}
