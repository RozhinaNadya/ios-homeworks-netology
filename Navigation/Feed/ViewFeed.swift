//
//  ViewFeed.swift
//  Navigation
//
//  Created by Надежда on 21.10.2021.
//

import UIKit

class ViewFeed: UIView {
    
    weak var delegate: FeedViewControllerDelegate?
    
    var buttonPost1: CustomButton = {
        let button = CustomButton(title: "Create post №1")
        return button
    }()
    
    var buttonPost2: CustomButton = {
        let button = CustomButton(title: "Create post №2")
        return button
    }()
    
    var feedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.addShadow()
        stackView.backgroundColor = .clear
        stackView.addShadow()
        return stackView
    }()
    
    var passwordTextField: UITextField = {
        let password = UITextField()
        password.toAutoLayout()
        password.indent(size: 10)
        password.placeholder = "Enter password"
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.lightGray.cgColor
        return password
    }()
    
    var passwordButton: CustomButton = {
        let button = CustomButton(title: "OK")
        button.onTap = {
            
        }
        return button
    }()
    
    var checkPasswordLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayoutButtonPost()
        goStack()
    }
    
    private func buttonTapped() {
        delegate?.onButton()
    }
    
    func goStack(){
        [buttonPost1, buttonPost2]
            .map { [weak self] in
                var button = UIButton()
                button = $0
                self?.feedStackView.addArrangedSubview(button)
            }
    }
    
    func configureLayoutButtonPost() {
        
        addSubviews([feedStackView, passwordTextField, passwordButton, checkPasswordLabel])
        
        NSLayoutConstraint.activate([
            buttonPost1.heightAnchor.constraint(equalToConstant: 50),
            buttonPost2.heightAnchor.constraint(equalToConstant: 50),
            
            feedStackView.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            feedStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            feedStackView.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: feedStackView.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: feedStackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: feedStackView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordButton.heightAnchor.constraint(equalToConstant: 50),
            
            checkPasswordLabel.topAnchor.constraint(equalTo: passwordButton.bottomAnchor, constant: 10),
            checkPasswordLabel.heightAnchor.constraint(equalToConstant: 50),
            checkPasswordLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
