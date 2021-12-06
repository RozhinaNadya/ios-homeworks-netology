//
//  ViewInfo.swift
//  Navigation
//
//  Created by Надежда on 26.10.2021.
//

import UIKit

class ViewInfo: UIView {
    
    var buttonInfo: UIButton = {
        let buttonInfo = UIButton()
        buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonInfo.setTitle("Подробне", for: .normal)
        buttonInfo.backgroundColor = .systemBlue
        buttonInfo.addShadow()
        return buttonInfo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonInfo)
        configureLayoutButtonInfo()
    }
    
    func configureLayoutButtonInfo() {
        let constrInfo: [NSLayoutConstraint] = [
            buttonInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            buttonInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonInfo.heightAnchor.constraint(equalToConstant: 50),
            buttonInfo.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constrInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
