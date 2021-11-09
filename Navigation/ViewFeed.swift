//
//  ViewFeed.swift
//  Navigation
//
//  Created by Надежда on 21.10.2021.
//

import UIKit

class ViewFeed: UIView {
    
    var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 95, y: 300, width: 200, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = true
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Создать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addShadow()
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
