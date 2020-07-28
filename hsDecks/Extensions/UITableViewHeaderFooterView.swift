//
//  UITableViewHeaderFooterView.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 28.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {
    func setDeckDetailSectionHeader() {
        self.tintColor = .clear
        guard let sectionText = self.textLabel?.text else { return }
        let textLabel = UILabel()
        self.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textLabel.text = sectionText
        textLabel.textColor = .black
        textLabel.font = .boldSystemFont(ofSize: 20)
        self.textLabel?.isHidden = true
    }
}
