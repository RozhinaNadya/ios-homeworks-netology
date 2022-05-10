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
    }
    

    func onButtonTap() {
        print("button tapped")
        let vcPost = PostViewController(.yellow, title: "Новый пост")
        self.navigationController?.pushViewController(vcPost, animated: true)
    }
    
    var post = PostViewController.Post(title: "New Post")
}

extension FeedViewController: FeedViewControllerDelegate {
    func onButton() {
        print("tap on button")
        guard let userPassword = viewFeed.passwordTextField.text else {return}
        viewFeed.checkPasswordLabel.text = userPassword
        viewFeed.checkPasswordLabel.textColor = { userPassword == viewModel.password ? .green : .red}()
    }
}
