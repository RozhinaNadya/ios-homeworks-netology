//
//  PostViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    weak var coordinator: PostCoordinator?
    
    struct Post {
        var title: String
    }
    
    var backgroundColor: UIColor = .clear
    
    var postView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()
    
    init(_ color: UIColor, title: String = "Post") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = ViewFeed()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(clickedButton))
        configureLayoutPost()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
    
    @objc func clickedButton() {
        let vcInfo = InfoViewController()
        present(vcInfo, animated: true)
    }
    
    func configureLayoutPost() {
        view.addSubview(postView)
        let constrArrayPost: [NSLayoutConstraint] = [
            postView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            postView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            postView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            postView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ]
        NSLayoutConstraint.activate(constrArrayPost)
    }
}
