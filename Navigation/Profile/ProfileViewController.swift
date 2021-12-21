//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    init(_ color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    let profileHeaderView = ProfileHeaderView()
    
    var newButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addShadow()
        return button
    }()
    
    let postOne = PostView(author: "Google memes", descriptionn: "Eto ya после полугодового обучения", image: "gde_swift.jpg", like: 55, views: 100)
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLayoutHeaderView()
    }
    
    func configureLayoutHeaderView() {
        self.view.addSubviews([profileHeaderView, postOne!])
        profileHeaderView.toAutoLayout()
        postOne!.toAutoLayout()
        let constrHeaderView : [NSLayoutConstraint] = [
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
       //     newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
       //     newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
       //     newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            postOne!.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            postOne!.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor),
            postOne!.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constrHeaderView)
    }
}

