//
//  DeckDetailViewContoller.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DeckDetailViewContoller: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
    
    private let viewModel: DeckDetailViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: DeckDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewConfiguration()
    }
}

extension DeckDetailViewContoller: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func bindViewModel() {
        viewModel.navigationTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.deck
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items) { (tableView, row, card) in
                let cell = DeckDetailTableViewCell(style: .default,
                                                   reuseIdentifier: DeckDetailTableViewCell.reuseIdentifier,
                                                   viewModel: DeckDetailTableViewCellViewModel(card))
                return cell
            }.disposed(by: disposeBag)
    }
}
