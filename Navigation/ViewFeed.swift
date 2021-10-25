//
//  ViewFeed.swift
//  Navigation
//
//  Created by Надежда on 21.10.2021.
//

import UIKit

class ViewFeed: UIView {
    
    var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Создать пост", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    var shadowView: UIView = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(shadowView)
        shadowView.addSubview(button)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        let views: [String: Any] = [
            "superView": self,
            "shadow": shadowView,
            "button": button
        ]
        
        var constrArray: [NSLayoutConstraint] = []
        
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[shadow]-20-|", metrics: nil, views: views)
        
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[shadow]-20-|", metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constrArray)
        
    }
    

}


