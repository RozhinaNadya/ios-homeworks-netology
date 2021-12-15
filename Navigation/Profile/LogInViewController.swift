//
//  LogInViewController.swift
//  Navigation
//
//  Created by Надежда on 12.12.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    init(_ color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var logInScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    var contentView: UIView = {
        let content = UIView()
        content.toAutoLayout()
        return content
    }()
    
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
        let pixelImage = UIImage(named: "blue_pixel.png")
        button.setBackgroundImage(pixelImage, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .selected)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .highlighted)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .disabled)
        return button
    }()
    
    @objc func logInButtonPress(){
        let profile = ProfileViewController(.white, title: "Профиль")
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    //не работает этот вариант 1
    /*
    func updateLoginButton() {
        guard
            let email = logInText.text, !email.isEmpty,
            let password = passwordText.text, !password.isEmpty
            else {
                logInButton.isEnabled = false
                logInButton.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .selected)
                logInButton.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .highlighted)
                logInButton.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .disabled)
                return
        }
        logInButton.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
        logInButton.isEnabled = true
        
    }*/
    
    //не работает этот вариант 2
    /*
    @objc func tapText(){
        if logInText.text.isEmpty == true {
            logInButton.isEnabled = false
        } else {logInButton.isEnabled = true}
    }*/
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
        logInButton.addTarget(self, action: #selector(logInButtonPress), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goStack()
        self.view.addSubview(logInScrollView)
        self.logInScrollView.addSubview(contentView)
        self.contentView.addSubviews([iconVk, logInStackView, logInButton])
        let constraintLogIn: [NSLayoutConstraint] = [
            logInScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            logInScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            logInScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            logInScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: logInScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: logInScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: logInScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: logInScrollView.widthAnchor),
            
            iconVk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            iconVk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconVk.heightAnchor.constraint(equalToConstant: 100),
            iconVk.widthAnchor.constraint(equalToConstant: 100),
            
            logInStackView.topAnchor.constraint(equalTo: iconVk.bottomAnchor, constant: 120),
            logInStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),
            logInText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: logInStackView.trailingAnchor),
            logInButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor)
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
        self.tintColor = UIColor(named: "AccentColor")
        self.backgroundColor = .systemGray6
    }
}


