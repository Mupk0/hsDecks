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
    private let cardImageView = ImageView()
    private let cardRarityColorView = UIView()
    private let frontView = UIView()
    private let rightView = UIView()
    private let cardNameGradientView = UIView()
    private var cardNameLabel = UILabel()
    private let cardCostLabel = UILabel()
    private let cardCounterLabel = UILabel()
    
    private let backImageView = UIImageView(image: #imageLiteral(resourceName: "deckListMiddleNoShadow"))
    private let gradientColor = UIColor(red: 0.16,
                                        green: 0.18,
                                        blue: 0.24,
                                        alpha: 1.00)
    private let counterColor = UIColor(red: 0.99,
                                       green: 0.82,
                                       blue: 0.23,
                                       alpha: 1.00)
    
    private var viewModel: DeckDetailTableViewCellViewModel
    private var disposeBag = DisposeBag()
    
    init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?,
         viewModel: DeckDetailTableViewCellViewModel) {
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
        
        cardNameGradientView.addGradientBackground(firstColor: Color.gradientColor,
                                                   secondColor: .clear)
    }
}

extension DeckDetailTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cardImageView)
        addSubview(cardNameBackgroundView)
        addSubview(cardNameGradientView)
        addSubview(frontView)
        addSubview(rightView)
        addSubview(cardRarityColorView)
        addSubview(backImageView)
        addSubview(cardCounterLabel)
        addSubview(cardNameLabel)
        addSubview(cardCostView)
        addSubview(cardCostLabel)
    }
    
    func configureViews() {
        selectionStyle = .none
        backgroundColor = UIColor(red: 0.21, green: 0.16, blue: 0.27, alpha: 1.00)
        
        cardCostView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card_list_left"))
        frontView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card_list_middle"))
        rightView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card_list_right"))
        cardNameBackgroundView.backgroundColor = Color.gradientColor
        
        cardCostLabel.textAlignment = .center
        cardCounterLabel.textAlignment = .center
        
        cardImageView.contentMode = .scaleAspectFit
        backImageView.contentMode = .scaleToFill
        cardImageView.sizeToFit()
    }
    
    func setupConstraints() {
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -20).isActive = true
        
        cardNameBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cardNameBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                        constant: 40).isActive = true
        cardNameBackgroundView.trailingAnchor.constraint(equalTo: cardImageView.leadingAnchor,
                                                         constant: 85).isActive = true
        
        cardNameGradientView.translatesAutoresizingMaskIntoConstraints = false
        cardNameGradientView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameGradientView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameGradientView.leadingAnchor.constraint(equalTo: cardNameBackgroundView.trailingAnchor).isActive = true
        cardNameGradientView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        cardCostView.translatesAutoresizingMaskIntoConstraints = false
        cardCostView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCostView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCostView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: 27).isActive = true
        cardCostView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardCostLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCostLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCostLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCostLabel.leadingAnchor.constraint(equalTo: cardCostView.leadingAnchor).isActive = true
        cardCostLabel.trailingAnchor.constraint(equalTo: cardCostView.trailingAnchor).isActive = true
        
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: cardCostView.trailingAnchor,
                                               constant: 5).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: cardCounterLabel.leadingAnchor).isActive = true
        
        cardCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCounterLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardCounterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardCounterLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -38).isActive = true
        cardCounterLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        cardRarityColorView.translatesAutoresizingMaskIntoConstraints = false
        cardRarityColorView.topAnchor.constraint(equalTo: topAnchor,
                                                 constant: 10).isActive = true
        cardRarityColorView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                    constant: -10).isActive = true
        cardRarityColorView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        cardRarityColorView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -34).isActive = true
        
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        frontView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        frontView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: 40).isActive = true
        frontView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                            constant: -40).isActive = true
        
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                            constant: -29).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func bindViewModel() {
        let layoutSubviews = rx.sentMessage(#selector(UITableViewCell.layoutSubviews)).take(1).mapToVoid().asDriverComplete()
        let input = DeckDetailTableViewCellViewModel.Input(trigger: layoutSubviews)
        
        let output = viewModel.transform(input: input)
        output.tileImage
            .drive(onNext: { [weak self] id in
                guard let self = self else { return }
                let url = "\(Constants.imageTilesUrl)\(id).png"
                self.cardImageView.fetchImage(with: url)
            })
            .disposed(by: disposeBag)
        output.name
            .drive(onNext: { [weak self] name in
                guard let self = self else { return }
                let label = self.cardNameLabel
                label.attributedText = OutlineText.setAttributedString(string: name,
                                                                       font: Font.belwe(size: 20).font,
                                                                       outlineSize: 3,
                                                                       textColor: .white,
                                                                       outlineColor: .black)
            })
            .disposed(by: disposeBag)
        output.cost
            .drive(onNext: { [weak self] name in
                guard let self = self else { return }
                let label = self.cardCostLabel
                label.attributedText = OutlineText.setAttributedString(string: name,
                                                                       font: Font.belwe(size: 26).font,
                                                                       outlineSize: 3,
                                                                       textColor: .white,
                                                                       outlineColor: .black)
            })
            .disposed(by: disposeBag)
        output.count
            .drive(onNext: { [weak self] name in
                guard let self = self else { return }
                let label = self.cardCounterLabel
                label.attributedText = OutlineText.setAttributedString(string: name,
                                                                       font: Font.belwe(size: 18).font,
                                                                       outlineSize: 3,
                                                                       textColor: .white,
                                                                       outlineColor: Color.counterColor)
            })
            .disposed(by: disposeBag)
        output.rarityColor
            .drive(cardRarityColorView.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
}
