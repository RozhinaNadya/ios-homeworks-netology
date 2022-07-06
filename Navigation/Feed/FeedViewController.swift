//
//  FeedViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let viewModel: FeedModel
    
    let viewFeed = ViewFeed()
    
    var coordinator: FeedCoordinator?
    
    init(viewModel: FeedModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = viewFeed
        viewFeed.buttonPost1.onTap = {
            self.onButtonTap()
        }
        viewFeed.buttonPost2.onTap = {
            self.onButtonTap()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFeed.delegate = self
        viewFeed.passwordButton.onTap = {
            self.onButton()
        }
        self.hideKeyboard()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }

    func onButtonTap() {
        print("onButtonTap tapped")
        self.coordinator = FeedCoordinator(navigation: self.navigationController ?? UINavigationController())
        self.coordinator?.postSubscription()
    }
}

extension FeedViewController: FeedViewControllerDelegate {
    func onButton() {
        print("tap on button")
        if viewFeed.passwordTextField.text?.isEmpty == true {
            ApiError().handle(error: .passwordEmpty(viewController: self))
        }
        guard let userPassword = viewFeed.passwordTextField.text else {return ApiError().handle(error: .notFound(element: "viewFeed.passwordTextField.text"))}
        viewFeed.checkPasswordLabel.text = userPassword
        viewFeed.checkPasswordLabel.textColor = { userPassword == viewModel.password ? .green : .red}()
    }
}
