//
//  FeedViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = ViewFeed()
        self.view = view
        view.buttonPost1.onTap = {
            self.onButtonTap()
        }
        view.buttonPost2.onTap = {
            self.onButtonTap()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func onButtonTap() {
        print("button tapped")
        let vcPost = PostViewController(.yellow, title: "Новый пост")
        self.navigationController?.pushViewController(vcPost, animated: true)
    }
    
    var post = PostViewController.Post(title: "New Post")
}
