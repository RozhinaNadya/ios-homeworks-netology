//
//  ViewFeed.swift
//  Navigation
//
//  Created by Надежда on 21.10.2021.
//

import UIKit

class ViewFeed: UIView {
    
    var buttonPost: UIButton = {
        //let button = UIButton(frame: CGRect(x: 95, y: 300, width: 200, height: 50))
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Создать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addShadow()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonPost)
        configureLayoutButtonPost()
    }
    
    func configureLayoutButtonPost() {
        
        let constrButton : [NSLayoutConstraint] = [
            buttonPost.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            buttonPost.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonPost.widthAnchor.constraint(equalToConstant: 200),
            buttonPost.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constrButton)
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
