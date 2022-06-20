//
//  Extension.swift
//  Navigation
//
//  Created by Надежда on 26.01.2022.
//

import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .init(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.7
    }
    
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach{ addSubview($0) }
    }
}

extension UITextField {
    
    func toLogInText() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 16)
        self.autocapitalizationType = .none
        self.tintColor = UIColor(named: "AccentColor")
        self.backgroundColor = .systemGray6
    }
}
