//
//  DeckCategoryViewController.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 05.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit

class DeckCategoryViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero,
                                        style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupViewConfiguration()
    }
}

extension DeckCategoryViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        navigationItem.title = "hsDecks"
        
        tableView.separatorInset = .zero
        tableView.setBackgroundParchment()
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func bindViewModel() {}
}

extension DeckCategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let vc = DeckTypeSections.init(id: indexPath.row).vc
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DeckCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return DeckTypeSections.allValues.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = Font.belwe(size: 20).font
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = DeckTypeSections.init(id: indexPath.row).name
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}
