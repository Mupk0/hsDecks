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
    
    private let tableView = UITableView(frame: .zero,
                                        style: .grouped)
    private let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                     target: self,
                                                     action: nil)
    
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
        tableView.rowHeight = 44
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        
        tableView.backgroundColor = UIColor(red: 0.21,
                                            green: 0.16,
                                            blue: 0.27,
                                            alpha: 1.00)
        
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
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.cards
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items) { (tableView, row, card) in
                let cell = DeckDetailTableViewCell(style: .default,
                                                   reuseIdentifier: DeckDetailTableViewCell.reuseIdentifier,
                                                   viewModel: DeckDetailTableViewCellViewModel(card))
                return cell
        }.disposed(by: disposeBag)
        
        viewModel.deckHeader
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                let headerView = DeckDetailSectionHeaderView()
                headerView.setDetailHeader($0)
                self?.tableView.tableHeaderView = headerView
            }).disposed(by: disposeBag)
        
        rightBarButtonItem.rx.tap
            .subscribe { [weak self] _ in
                guard let strongSelf = self else { return }
                
                self?.viewModel.deckCode.subscribe(onNext :{ deckCode in
                    
                    let copyDeckAlert = UIAlertController(title: "Successfully",
                                                          message: "Deck Code Saved in Buffer",
                                                          preferredStyle: .alert)
                    
                    copyDeckAlert.addAction(UIAlertAction(title: "OK",
                                                          style: .default,
                                                          handler: nil))
                    self?.present(copyDeckAlert, animated: true, completion: nil)
                    UIPasteboard.general.string = deckCode
                }).disposed(by: strongSelf.disposeBag)
        }.disposed(by: disposeBag)
    }
}

extension DeckDetailViewContoller: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textAlignment = .center
        header.textLabel?.font = .boldSystemFont(ofSize: 20)
        header.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        let footerView = DeckDetailSectionFooterView()
        return footerView
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
