//
//  ViewInfo.swift
//  Navigation
//
//  Created by Надежда on 26.10.2021.
//

import UIKit

class ViewInfo: UIView {
    
    var buttonInfo: UIButton = {
        let buttonInfo = UIButton(frame: CGRect(x: 95, y: 300, width: 200, height: 50))
        buttonInfo.translatesAutoresizingMaskIntoConstraints = true
        buttonInfo.setTitle("Подробне", for: .normal)
        buttonInfo.backgroundColor = .red
        return buttonInfo
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
