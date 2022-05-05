//
//  CustomButton.swift
//  Navigation
//
//  Created by Надежда on 2022-05-05.
//

import UIKit

final class CustomButton: UIButton {
    private var title: String
    private var onTap: (() -> Void)?
    private let pixelImage = UIImage(named: "blue_pixel.png")
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setBackgroundImage(pixelImage, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        toAutoLayout()
        layer.cornerRadius = 10
        clipsToBounds = true
        setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
        setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .selected)
        setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .highlighted)
        setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .disabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        onTap?()
    }
}
