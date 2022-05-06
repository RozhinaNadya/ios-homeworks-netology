//
//  ViewFeed.swift
//  Navigation
//
//  Created by Надежда on 21.10.2021.
//

import UIKit

class ViewFeed: UIView {
    
    var buttonPost1: CustomButton = {
        let button = CustomButton(title: "Создать пост №1")
        return button
    }()
    
    var buttonPost2: CustomButton = {
        let button = CustomButton(title: "Создать пост №2")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayoutButtonPost()
        goStack()
    }
    
    func configureLayoutButtonPost() {
        
        addSubview(feedStackView)
        
        let constrButton : [NSLayoutConstraint] = [
            buttonPost1.heightAnchor.constraint(equalToConstant: 50),
            buttonPost2.heightAnchor.constraint(equalToConstant: 50),
            feedStackView.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            feedStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            feedStackView.widthAnchor.constraint(equalToConstant: 300),
        ]
        NSLayoutConstraint.activate(constrButton)
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var feedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.layer.cornerRadius = 4
        stackView.addShadow()
        stackView.backgroundColor = .white
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 1
        stackView.addShadow()
        return stackView
    }()
    
    func goStack(){
        [buttonPost1, buttonPost2]
            .map { [weak self] in
                var button = UIButton()
                button = $0
                self?.feedStackView.addArrangedSubview(button)
            }
    }
}
