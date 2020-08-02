//
//  ClassSelectViewController.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 12.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit
import RxSwift

class ClassSelectViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero,
                                        style: .plain)
    
    private let leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back_button_mini").withRenderingMode(.alwaysOriginal),
                                                    style:.plain,
                                                    target: self,
                                                    action: nil)
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupViewConfiguration()
    }
}

extension ClassSelectViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        navigationItem.title = "Hero Class List"
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        tableView.rowHeight = 60
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
    
    func bindViewModel() {
        leftBarButtonItem.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }
}

extension ClassSelectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let cardClass = CardClass.init(id: indexPath.row).description
        let viewModel = DecksByClassViewModel(deckClass: cardClass)
        let vc = DecksByClassViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ClassSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return CardClass.allValues.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cardClass = CardClass.init(id: indexPath.row)
        let identifier = ClassSelectTableViewCell.reuseIdentifier
        let viewModel = ClassSelectTableViewCellViewModel(cardClass)
        let cell = ClassSelectTableViewCell(style: .default,
                                            reuseIdentifier: identifier,
                                            viewModel: viewModel)
        
        return cell
    }
}
