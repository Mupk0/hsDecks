//
//  DecksByClassViewController.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 12.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DecksByClassViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero,
                                        style: .plain)
    
    private let viewModel: DecksByClassViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: DecksByClassViewModel) {
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

extension DecksByClassViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
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
        viewModel.getNavigationTitle()
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        // MARK: - binding from ViewModel to DeckListTableViewCell
        viewModel.getDecks()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items) { (tableView, row, deck) in
                let cell = DeckListTableViewCell(style: .default,
                                                 reuseIdentifier: DeckListTableViewCell.reuseIdentifier,
                                                 viewModel: DeckListTableViewCellViewModel(deck),
                                                 row: row)
                return cell
        }.disposed(by: disposeBag)
        // MARK: - event handling when cell selected
        tableView.rx.modelSelected(Deck.self)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                let vc = DeckDetailViewContoller(viewModel: DeckDetailViewModel(deck: $0))
                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        // MARK: - subscribe to tableView when item has been deleted, then remove todo to persistent storage via viewmodel
        tableView.rx.itemDeleted
            .subscribe(onNext : { [weak self] indexPath in
                self?.viewModel.removeDeck(withIndex: indexPath.row)
            })
            .disposed(by: disposeBag)
    }
}
