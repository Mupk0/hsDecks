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
    
    private let classDeckCounterView = UIView()
    private let classNameLabel = UILabel.makeForCardLabel()
    private let classDeckCounterLabel = UILabel.makeForCardLabel(color: .white)
    //private let classImageView = UIImageView()
    
    private var viewModel: ClassSelectTableViewCellViewModel
    private var disposeBag = DisposeBag()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewModel: ClassSelectTableViewCellViewModel) {
        self.viewModel = viewModel
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        //classImageView.image = nil
        classNameLabel.text = nil
        classDeckCounterLabel.text = nil
    }
}

extension ClassSelectTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        //addSubview(classImageView)
        addSubview(classDeckCounterView)
        addSubview(classNameLabel)
        addSubview(classDeckCounterLabel)
    }
    
    func configureViews() {
        selectionStyle = .none

        classDeckCounterView.backgroundColor = .gray
        classDeckCounterLabel.textAlignment = .center
        //classImageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints() {
//        classImageView.translatesAutoresizingMaskIntoConstraints = false
//        classImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        classImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
//        classImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100).isActive = true
//        classImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        classDeckCounterView.translatesAutoresizingMaskIntoConstraints = false
        classDeckCounterView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        classDeckCounterView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        classDeckCounterView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        classDeckCounterView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        classNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        classNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        classNameLabel.trailingAnchor.constraint(equalTo: classDeckCounterView.trailingAnchor).isActive = true
        
        classDeckCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        classDeckCounterLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        classDeckCounterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        classDeckCounterLabel.leadingAnchor.constraint(equalTo: classDeckCounterView.leadingAnchor).isActive = true
        classDeckCounterLabel.trailingAnchor.constraint(equalTo: classDeckCounterView.trailingAnchor).isActive = true
    }
    
    func bindViewModel() {
        let layoutSubviews = rx.sentMessage(#selector(UITableViewCell.layoutSubviews)).take(1).mapToVoid().asDriverComplete()
        let input = ClassSelectTableViewCellViewModel.Input(trigger: layoutSubviews)
        
        let output = viewModel.transform(input: input)
//        output.classImage
//            .drive(onNext: { [weak self] (image) in
//                guard let self = self else {return}
//                self.classImageView.image = image
//            })
//            .disposed(by: disposeBag)
        output.classDescription
            .drive(classNameLabel.rx.text)
            .disposed(by: disposeBag)
        output.counter
            .drive(classDeckCounterLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
