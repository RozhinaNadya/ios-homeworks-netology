//
//  PostViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
        
    var backgroundColor: UIColor = .clear
    
    var postView: View = {
        let view = View(frame: .zero)
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
        
        postView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(postView)
    }
    
    @objc func clickedButton() {
        let vcInfo = InfoViewController()
        present(vcInfo, animated: true)
    }
    
    struct Post {
    var title: String
    }

}
