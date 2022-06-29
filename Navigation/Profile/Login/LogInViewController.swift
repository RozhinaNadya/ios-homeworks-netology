//
//  LogInViewController.swift
//  Navigation
//
//  Created by Надежда on 12.12.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let loginInspector: LoginViewControllerService
    
    var coordinator: LoginCoordinator?
    
    let passwordGuessing = PasswordGuessing()
    
    let passwordOperation = OperationQueue()
    
    var timerLogin: Timer?
    
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
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .lightGray
        return label
    }()
    
    var durationTime = 20
    
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
        text.indent(size: 10)
        text.placeholder = "Email, phone or nickname"
        return text
    }()
    
    var passwordText: UITextField = {
        let password = UITextField()
        password.toLogInText()
        password.toAutoLayout()
        password.indent(size: 10)
        password.placeholder = "Password"
        return password
    }()
    
    var logInButton: CustomButton = {
        let button = CustomButton(title: "Log in")
        return button
    }()
    
    var picUpPasswordButton: CustomButton = {
        let button = CustomButton(title: "Pick up a password")
        return button
    }()
    
    private lazy var activityIndecator: UIActivityIndicatorView = {
        activityIndecator = UIActivityIndicatorView(style: .large)
        activityIndecator.toAutoLayout()
        return activityIndecator
    }()
    
    init(inspector: LoginViewControllerService) {
        self.loginInspector = inspector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        logInButton.onTap = { self.goToProfile() }
        passwordText.addTarget(self, action: #selector(tapText), for: .allEvents)
        picUpPasswordButton.onTap = {
            [weak self] in
            self?.getPassword()
        }
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
        coordinator?.didFinishBuying()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goStack()
        logInScrollView.keyboardDismissMode = .interactive
        goLogin()
        self.navigationController?.navigationBar.isHidden = true
        createTimer()
    }
    
    @objc func timerGo() {
        DispatchQueue.main.async {
            
            if self.durationTime != 0 {
                self.durationTime -= 1
                if self.durationTime < 11 {
                    self.timerLabel.text = "Left before data reset: \(self.durationTime) s"
                }
            } else {
                self.logInText.text = ""
                self.passwordText.text = ""
                self.timerLabel.text = ""
                self.durationTime = 20
            }
        }
    }
    
    func createTimer() {
        if timerLogin == nil {
            DispatchQueue.global().async {
                let timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.timerGo), userInfo: nil, repeats: true)
                RunLoop.current.add(timer, forMode: .common)
                RunLoop.current.run()
                timer.tolerance = 0.1
                self.timerLogin = timer
            }
        }
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
    
    func getPassword() {
        activityIndecator.startAnimating()
        
        self.picUpPasswordButton.isHidden = true
        guard let enteredLogin = self.logInText.text else {return ApiError().handle(error: .notFound(element: "logInText.text"))}
        passwordGuessing.completionBlock = { [weak self] in
            DispatchQueue.global().async {
                self?.passwordText.text = self?.passwordGuessing.bruteForce(login: enteredLogin)
                self?.passwordText.isSecureTextEntry = false
                self?.activityIndecator.stopAnimating()
            }
        }
        passwordOperation.addOperation(passwordGuessing)
        passwordOperation.qualityOfService = .userInitiated
        self.picUpPasswordButton.isHidden = false
    }
    
    func goStack() {
        [logInText, passwordText].map {[weak self] in
            var text = UITextField()
            text = $0
            self?.logInStackView.addArrangedSubview(text)
        }
    }
    func goToProfile() {
        guard let userName = logInText.text else {return ApiError().handle(error: .notFound(element: "logInText.text in goToProfile"))}
        self.logInButtonPress() {
           result in
            switch result {
            case .success(let userService):
                self.coordinator = LoginCoordinator(navigation: self.navigationController ?? UINavigationController())
                self.coordinator?.profileSubscription(userName: userName, userService: userService)
                self.navigationController?.tabBarItem.title = TabBarModel().profileTitle
            case .failure(_):
                ApiError().handle(error: .wrongPassword(viewController: self))
            }
        }
    }
    
    func logInButtonPress(completion: @escaping (Result<UserService, AppError>) -> Void) {
        
        guard let userName = logInText.text else {return ApiError().handle(error: .loginEmpty(viewController: self))}
        guard let userPassword = passwordText.text else {return ApiError().handle(error: .passwordEmpty(viewController: self))}
        
#if DEBUG
        let userService = TestUserService()
#else
        let user = User(fullName: userName)
        let userService = CurrentUserService(user: user)
#endif
        if loginInspector.checkLoginPassword(login: userName, password: userPassword) == true {
            completion(.success(userService))
                       } else {
                completion(.failure(.wrongPassword(viewController: self)))
            }
    }
    
    func goLogin() {
        self.view.addSubview(logInScrollView)
        self.logInScrollView.addSubview(contentView)
        self.contentView.addSubviews([iconVk, logInStackView, logInButton, picUpPasswordButton, activityIndecator, timerLabel])
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
            
            timerLabel.topAnchor.constraint(equalTo: iconVk.bottomAnchor, constant: 50),
            timerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
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
            
            picUpPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 50),
            picUpPasswordButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor),
            picUpPasswordButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor),
            picUpPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            picUpPasswordButton.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor),
            
            activityIndecator.centerYAnchor.constraint(equalTo: logInStackView.centerYAnchor),
            activityIndecator.centerXAnchor.constraint(equalTo: logInStackView.centerXAnchor),
        ]
        NSLayoutConstraint.activate(constraintLogIn)
    }
}

