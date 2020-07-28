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
    
    private let cardNameBackgroundView = UIView()
    private let cardCostView = UIView()
    private let cardCounterView = UIView()
    private let cardImageView = UIImageView()
    private let cardRarityColorView = UIView()
    private let frontView = UIView()
    private let rightView = UIView()
    private let cardNameGradientView = UIView()
    private let cardNameLabel = UILabel.makeForCardLabel()
    private let cardCostLabel = UILabel.makeForCardLabel()
    private let cardCounterLabel = UILabel.makeForCardLabel()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardNameGradientView.addGradientBackground(firstColor: .black,
                                                   secondColor: .clear)
    }
}

extension DeckDetailTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cardImageView)
        addSubview(cardNameBackgroundView)
        addSubview(cardNameGradientView)
        addSubview(cardNameLabel)
        addSubview(frontView)
        addSubview(cardCostView)
        addSubview(cardCostLabel)
        addSubview(rightView)
        addSubview(cardCounterView)
        addSubview(cardCounterLabel)
        addSubview(cardRarityColorView)
    }
    
    func configureViews() {
        selectionStyle = .none
        
        let cardLeftImage = UIImage(named: "card_list_left") ?? UIImage()
        let cardMiddleImage = UIImage(named: "card_list_middle") ?? UIImage()
        let cardRightImage = UIImage(named: "card_list_right") ?? UIImage()

        backgroundColor = .clear
        cardCostView.backgroundColor = UIColor(patternImage: cardLeftImage)
        frontView.backgroundColor = UIColor(patternImage: cardMiddleImage)
        rightView.backgroundColor = UIColor(patternImage: cardRightImage)
        cardNameBackgroundView.backgroundColor = .black
        cardCounterView.backgroundColor = .darkGray
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
        
        cardNameBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cardNameBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        cardNameBackgroundView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        cardNameGradientView.translatesAutoresizingMaskIntoConstraints = false
        cardNameGradientView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameGradientView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameGradientView.leadingAnchor.constraint(equalTo: cardNameBackgroundView.trailingAnchor).isActive = true
        cardNameGradientView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        cardCostView.translatesAutoresizingMaskIntoConstraints = false
        cardCostView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCostView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCostView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardCostView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardCounterView.translatesAutoresizingMaskIntoConstraints = false
        cardCounterView.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        cardCounterView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
        cardCounterView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        cardCounterView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
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
        cardRarityColorView.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        cardRarityColorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
        cardRarityColorView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        cardRarityColorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9).isActive = true
        
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        frontView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        frontView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        frontView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
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
