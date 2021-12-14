//
//  LogInViewController.swift
//  Navigation
//
//  Created by Надежда on 12.12.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    var backgroundColor: UIColor = .red
    
    init(_ color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
      //  goStack()
     //   configLayoutLogIn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var iconVk: UIImageView = {
        let iconImage = UIImage(named: "logo.png")
        let icon = UIImageView(image: iconImage)
        icon.toAutoLayout()
        icon.clipsToBounds = true
        return icon
    }()
    
    var logInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.backgroundColor = .lightGray
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.spacing = 0.5
        stackView.clipsToBounds = true
        return stackView
    }()
    
    var logInText: UITextView = {
        let text = UITextView()
        text.toAutoLayout()
        text.toLogInText()
        text.text = "Email or phone"
        return text
    }()
    
    var passwordText: UITextView = {
        let password = UITextView()
        password.toLogInText()
        password.toAutoLayout()
        password.text = "Password"
        password.isSecureTextEntry = true
        return password
    }()
    
    func goStack() {
        [logInText, passwordText].map {[weak self] in
            var text = UITextView()
            text = $0
            self?.logInStackView.addArrangedSubview(text)
        }
    }
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let pixelImage = UIImage(named: "blue_pixel.png")
        button.setBackgroundImage(pixelImage, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isNormalAlpha()
        
        //не получается альфа
        
        return button
    }()
    
  /*  func configLayoutLogIn() {
        view.addSubviews([iconVk, logInStackView, loginButton])
        let constraintLogIn: [NSLayoutConstraint] = [
            iconVk.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            iconVk.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            logInStackView.topAnchor.constraint(equalTo: iconVk.bottomAnchor, constant: 120),
            logInStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: logInStackView.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraintLogIn)
    }*/
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goStack()
        self.view.addSubviews([iconVk, logInStackView, logInButton])
        let constraintLogIn: [NSLayoutConstraint] = [
            iconVk.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            iconVk.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            iconVk.heightAnchor.constraint(equalToConstant: 100),
            iconVk.widthAnchor.constraint(equalToConstant: 100),
            
            logInStackView.topAnchor.constraint(equalTo: iconVk.bottomAnchor, constant: 120),
            logInStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),
            logInText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: logInStackView.trailingAnchor),
            logInButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraintLogIn)
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
}


extension UITextView {
    
    func toLogInText() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 16)
        self.autocapitalizationType = .none
        self.tintColor = UIColor(red: 72/255, green: 133/255, blue: 204/255, alpha: 1)
        self.backgroundColor = .systemGray6

    }
}

extension UIButton {
    func isNormalAlpha(){
        if self.alpha.isNormal == true {
            self.alpha = 1
        }
        else {
            self.alpha = 0.8
        }
    }
}
