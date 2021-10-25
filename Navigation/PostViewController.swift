//
//  PostViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    var backgroundColor: UIColor = .red


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
        view.button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onButtonTap))
        view.shadowView.addGestureRecognizer(gesture)
        self.view = view
        view.backgroundColor = backgroundColor
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func onButtonTap(){
        print("button tapped")
    }
    
    struct Post {
    var title: String
    }

}
