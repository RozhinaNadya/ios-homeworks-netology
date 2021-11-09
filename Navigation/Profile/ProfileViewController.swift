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
        let view = View()
        self.view = view
        view.backgroundColor = backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(profileHeaderView)
        profileHeaderView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
    }
    
}
