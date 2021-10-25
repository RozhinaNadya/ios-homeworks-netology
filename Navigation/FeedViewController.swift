//
//  FeedViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
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
        let view = ViewFeed()
        view.button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        self.view = view
        view.backgroundColor = backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func onButtonTap(){
        print("button tapped")
        let vcPost = PostViewController(.yellow, title: "Новый пост")
        self.navigationController?.pushViewController(vcPost, animated: false)
    }

    
    var post = PostViewController.Post(title: "New Post")
    
}
