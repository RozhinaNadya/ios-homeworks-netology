//
//  ViewController.swift
//  Navigation
//
//  Created by Надежда on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    init(_ color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = View()
        view.backgroundColor = backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

