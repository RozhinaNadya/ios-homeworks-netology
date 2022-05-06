//
//  Extension(UITextField).swift
//  Navigation
//
//  Created by Надежда on 26.01.2022.
//

import UIKit

extension UITextField {
    
    func toLogInText() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 16)
        self.autocapitalizationType = .none
        self.tintColor = UIColor(named: "AccentColor")
        self.backgroundColor = .systemGray6
    }
}
