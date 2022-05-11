//
//  LogInViewController.swift
//  Navigation
//
//  Created by Надежда on 12.12.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    var delegat: LoginViewControllerDelegate
    let loginInspector = LoginInspector()
    
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
    
    var logInText: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.toLogInText()
        text.placeholder = "Email, phone or nickname"
        return text
    }()
    
    var passwordText: UITextField = {
        let password = UITextField()
        password.toLogInText()
        password.toAutoLayout()
        password.placeholder = "Password"
        return password
    }()
    
    var logInButton: CustomButton = {
        let button = CustomButton(title: "Log in")
        return button
    }()
    
    init() {
        self.delegat = loginInspector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        logInButton.onTap = {self.logInButtonPress()}
        passwordText.addTarget(self, action: #selector(tapText), for: .allEvents)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goStack()
        logInScrollView.keyboardDismissMode = .interactive
        goLogin()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func tapText() {
        passwordText.isSecureTextEntry = true
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            logInScrollView.contentInset.bottom = keyboardSize.height
            logInScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        logInScrollView.contentInset.bottom = .zero
        logInScrollView.verticalScrollIndicatorInsets = .zero
    }
        
    func goStack() {
        [logInText, passwordText].map {[weak self] in
            var text = UITextField()
            text = $0
            self?.logInStackView.addArrangedSubview(text)
        }
    }
    
    func logInButtonPress() {
        
        guard let userName = logInText.text else {return}
        guard let userPassword = passwordText.text else {return}
        
#if DEBUG
        let userService = TestUserService()
#else
        let user = User(fullName: userName)
        let userService = CurrentUserService(user: user)
#endif
        
        if delegat.checkLoginPassword(login: userName, password: userPassword) == true {
            let modelView = ProfileModel(userName: userName, userService: userService)
            let profile = ProfileViewController(viewModel: modelView)
            self.navigationController?.pushViewController(profile, animated: true)
            
        } else {
            
            let alert = UIAlertController(title: "Не верный логин или пароль", message: "Пожалуйста, проверьте данные и повторите попытку", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func goLogin() {
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
    }
}

