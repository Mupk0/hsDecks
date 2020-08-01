//
//  ClassSelectTableViewCell.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 27.07.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import RxSwift
import RxCocoa

class ClassSelectTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ClassSelectTableViewCell"
    
    private let classNameLabel = UILabel.makeForCardLabel()
    private let classDeckCounterLabel = UILabel.makeForCardLabel(color: .white)
    private let classImageView = UIImageView()
    
    private var viewModel: ClassSelectTableViewCellViewModel
    private var disposeBag = DisposeBag()
    
    init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?,
         viewModel: ClassSelectTableViewCellViewModel) {
        self.viewModel = viewModel
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        classImageView.image = nil
        classNameLabel.text = nil
        classDeckCounterLabel.text = nil
    }
}

extension ClassSelectTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(classImageView)
        addSubview(classNameLabel)
        addSubview(classDeckCounterLabel)
    }
    
    func configureViews() {
        selectionStyle = .none
        
        backgroundColor = .clear
        classDeckCounterLabel.textAlignment = .center
        classImageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints() {
        classImageView.translatesAutoresizingMaskIntoConstraints = false
        classImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        classImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        classImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        classImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        classNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        classNameLabel.leadingAnchor.constraint(equalTo: classImageView.trailingAnchor, constant: 10).isActive = true
        classNameLabel.trailingAnchor.constraint(equalTo: classDeckCounterLabel.leadingAnchor).isActive = true
        
        classDeckCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        classDeckCounterLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        classDeckCounterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        classDeckCounterLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        classDeckCounterLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func bindViewModel() {
        let layoutSubviews = rx.sentMessage(#selector(UITableViewCell.layoutSubviews)).take(1).mapToVoid().asDriverComplete()
        let input = ClassSelectTableViewCellViewModel.Input(trigger: layoutSubviews)
        
        let output = viewModel.transform(input: input)
        output.classImage
            .drive(onNext: { [weak self] (image) in
                guard let self = self else {return}
                self.classImageView.image = image
            })
            .disposed(by: disposeBag)
        output.classDescription
            .drive(classNameLabel.rx.text)
            .disposed(by: disposeBag)
        output.counter
            .drive(onNext: { [weak self] name in
                guard let self = self else { return }
                let label = self.classDeckCounterLabel
                label.attributedText = OutlineText.setAttributedString(string: name,
                                                                       font: Font.belwe(size: 24).font,
                                                                       outlineSize: 3,
                                                                       textColor: Color.counterColor,
                                                                       outlineColor: .black)
            })
            .disposed(by: disposeBag)
    }
}
