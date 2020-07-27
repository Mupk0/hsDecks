//
//  NewDeckViewController.swift
//  hsDecks
//
//  Created by Dmitry Kulagin on 10.05.2020.
//  Copyright © 2020 Dmitry Kulagin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewDeckViewController: UIViewController {
    
    private let deckNameTextField = UITextField()
    private let deckCodeTextField = UITextField()
    private let deckCreateButton = UIButton()
    private let closeControllerButton = UIButton()
    
    let newDeck = PublishSubject<NewDeck>()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
    }
}

extension NewDeckViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        view.addSubview(deckNameTextField)
        view.addSubview(deckCodeTextField)
        view.addSubview(deckCreateButton)
        view.addSubview(closeControllerButton)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        
        deckCreateButton.setTitle("Add", for: .normal)
        deckCreateButton.backgroundColor = .blue
        closeControllerButton.setTitle("Cancel", for: .normal)
        closeControllerButton.backgroundColor = .red
        
        deckNameTextField.adjustsFontSizeToFitWidth = true
        deckNameTextField.minimumFontSize = 17
        deckNameTextField.backgroundColor = .lightGray
        deckNameTextField.borderStyle = .roundedRect
        deckNameTextField.placeholder = "Enter Deck Name"
        
        deckCodeTextField.adjustsFontSizeToFitWidth = true
        deckCodeTextField.minimumFontSize = 17
        deckCodeTextField.backgroundColor = .lightGray
        deckCodeTextField.borderStyle = .roundedRect
        deckCodeTextField.placeholder = "Enter Deck Code"

    }
    
    func setupConstraints() {
        deckNameTextField.translatesAutoresizingMaskIntoConstraints = false
        deckNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        deckNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        deckNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deckNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deckCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        deckCodeTextField.topAnchor.constraint(equalTo: deckNameTextField.bottomAnchor, constant: 10).isActive = true
        deckCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        deckCodeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deckCodeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deckCreateButton.translatesAutoresizingMaskIntoConstraints = false
        deckCreateButton.topAnchor.constraint(equalTo: deckCodeTextField.bottomAnchor, constant: 10).isActive = true
        deckCreateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45).isActive = true
        deckCreateButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deckCreateButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        closeControllerButton.translatesAutoresizingMaskIntoConstraints = false
        closeControllerButton.topAnchor.constraint(equalTo: deckCodeTextField.bottomAnchor, constant: 10).isActive = true
        closeControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -45).isActive = true
        closeControllerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeControllerButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func bindViewModel() {
        deckCreateButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                if let deckName = self?.deckNameTextField.text, let deckCode = self?.deckCodeTextField.text, deckName.count > 0 {
                    if let serializeDeck = DeckSerializer.deserialize(input: deckCode) {
                        self?.newDeck.onNext(NewDeck(deckName: deckName,
                                                     deckCode: deckCode,
                                                     deckClass: serializeDeck.playerClass))
                        self?.newDeck.onCompleted()
                    } else {
                        print("incorrect Deck Code")
                    }
                } else {
                    print("empty Deck Name")
                }
            })
            .disposed(by: disposeBag)
        
        closeControllerButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
}
