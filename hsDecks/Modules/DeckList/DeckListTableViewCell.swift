//
//  DeckListTableViewCell.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DeckListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DeckListTableViewCell"
    
    private let deckNameLabel = UILabel.makeForCardLabel()
    
    private var viewModel: DeckListTableViewCellViewModel
    private let row: Int
    private var disposeBag = DisposeBag()
    
    init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?,
         viewModel: DeckListTableViewCellViewModel,
         row: Int) {
        
        self.viewModel = viewModel
        self.row = row
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        deckNameLabel.text = nil
    }
}

extension DeckListTableViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(deckNameLabel)
    }
    
    func configureViews() {
        selectionStyle = .none
        let bgColor = UIColor(red: 0.38,
                              green: 0.26,
                              blue: 0.15,
                              alpha: 0.10)
        backgroundColor = row % 2 == 0 ? .clear : bgColor
    }
    
    func setupConstraints() {
        deckNameLabel.translatesAutoresizingMaskIntoConstraints = false
        deckNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        deckNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 10).isActive = true
        deckNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        deckNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func bindViewModel() {
        let layoutSubviews = rx.sentMessage(#selector(UITableViewCell.layoutSubviews)).take(1).mapToVoid().asDriverComplete()
        let input = DeckListTableViewCellViewModel.Input(trigger: layoutSubviews)
        
        let output = viewModel.transform(input: input)
        output.name
            .drive((deckNameLabel.rx.text))
            .disposed(by: disposeBag)
    }
}
