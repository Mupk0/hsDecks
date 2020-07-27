//
//  DeckDetailTableViewCell.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 04.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class DeckDetailTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DeckDetailTableViewCell"
    
    private let gradientView = UIView()
    private let cardCostView = UIView()
    private let cardCounterView = UIView()
    private let cardNameLabel = UILabel.makeForCardLabel()
    private let cardCostLabel = UILabel.makeForCardLabel()
    private let cardCounterLabel = UILabel.makeForCardLabel()
    private let cardImageView = UIImageView()
    private let cardRarityColorView = UIView()
    
    private var viewModel: DeckDetailTableViewCellViewModel
    private var disposeBag = DisposeBag()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewModel: DeckDetailTableViewCellViewModel) {
        self.viewModel = viewModel
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cardImageView.image = nil
        cardNameLabel.text = nil
        cardCostLabel.text = nil
        cardCounterLabel.text = nil
    }
}

extension DeckDetailTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cardImageView)
        addSubview(gradientView)
        addSubview(cardCostView)
        addSubview(cardCounterView)
        addSubview(cardNameLabel)
        addSubview(cardCostLabel)
        addSubview(cardCounterLabel)
        addSubview(cardRarityColorView)
    }
    
    func configureViews() {
        selectionStyle = .none
        
        gradientView.backgroundColor = .black
        cardCostView.backgroundColor = .systemBlue
        cardCounterView.backgroundColor = .gray
        cardCostLabel.textAlignment = .center
        cardCounterLabel.textAlignment = .center
        cardImageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100).isActive = true
        cardImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        gradientView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        cardCostView.translatesAutoresizingMaskIntoConstraints = false
        cardCostView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCostView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCostView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardCostView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardCounterView.translatesAutoresizingMaskIntoConstraints = false
        cardCounterView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCounterView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCounterView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        cardCounterView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: cardCostView.trailingAnchor, constant: 5).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: cardCounterView.trailingAnchor).isActive = true
        
        cardCostLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCostLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCostLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCostLabel.leadingAnchor.constraint(equalTo: cardCostView.leadingAnchor).isActive = true
        cardCostLabel.trailingAnchor.constraint(equalTo: cardCostView.trailingAnchor).isActive = true
        
        cardCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCounterLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCounterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCounterLabel.leadingAnchor.constraint(equalTo: cardCounterView.leadingAnchor).isActive = true
        cardCounterLabel.trailingAnchor.constraint(equalTo: cardCounterView.trailingAnchor).isActive = true
        
        cardRarityColorView.translatesAutoresizingMaskIntoConstraints = false
        cardRarityColorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardRarityColorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardRarityColorView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        cardRarityColorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func bindViewModel() {
        let layoutSubviews = rx.sentMessage(#selector(UITableViewCell.layoutSubviews)).take(1).mapToVoid().asDriverComplete()
        let input = DeckDetailTableViewCellViewModel.Input(trigger: layoutSubviews)
        
        let output = viewModel.transform(input: input)
        output.tileImage
            .drive(onNext: { [weak self] (image) in
                guard let self = self else {return}
                self.cardImageView.image = image
            })
            .disposed(by: disposeBag)
        output.name
            .drive(cardNameLabel.rx.text)
            .disposed(by: disposeBag)
        output.cost
            .drive(cardCostLabel.rx.text)
            .disposed(by: disposeBag)
        output.count
            .drive(cardCounterLabel.rx.text)
            .disposed(by: disposeBag)
        output.rarityColor
            .drive(cardRarityColorView.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
}
