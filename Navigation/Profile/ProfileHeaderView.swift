//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Надежда on 02.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var view: View = {
        let view = View(frame: .zero)
        return view
    }()
    
    var labelName: UILabel = {
        let label = UILabel(frame: CGRect(x: 130, y: 27, width: 175, height: 40))
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Икскодер"
        return label
    }()

    let avatar: UIImageView = {
        let imageName = "catImage.png"
        let avatarImage = UIImage(named: imageName)
        let avatarView = UIImageView(image: avatarImage)
        avatarView.frame = CGRect(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.layer.cornerRadius = avatarView.bounds.height / 2
        avatarView.clipsToBounds = true
        return avatarView
    }()
    
    let statusText: UITextView = {
        let status = UITextView(frame: CGRect(x: 125, y: 70, width: 175, height: 40))
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
        status.backgroundColor = .lightGray
        return status
    }()
    
    var statusButton: UIButton = {
        let view = View()
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.opacity = 0.7
        return button
        }()
        
    func configureLayout() {
        let views: [String: Any] = [
            "superView": self,
            "button": statusButton
        ]
        var constrArray: [NSLayoutConstraint] = []
        
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[button]-16-|", metrics: nil, views: views)
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "V:|-144-[button]-442-|", metrics: nil, views: views)
        NSLayoutConstraint.activate(constrArray)
        
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(labelName)
        addSubview(avatar)
        addSubview(statusText)
        addSubview(statusButton)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
