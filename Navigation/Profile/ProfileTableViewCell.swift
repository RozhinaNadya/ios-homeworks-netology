//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 13.01.2022.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewHeaderFooterView {
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Икскотер"
        return label
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageName = "catImage.png"
        let avatarImage = UIImage(named: imageName)
        let avatarView = UIImageView(image: avatarImage)
        avatarView.toAutoLayout()
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.clipsToBounds = true
        return avatarView
    }()
    
    lazy var statusTextField: UITextField = {
        let status = UITextField()
        status.toAutoLayout()
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.placeholder = "Waiting for something..."
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.addShadow()
        return button
    }()
    
    lazy var myText: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.font = .systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        return text
    }()
    
    private var statusText: String = "Waiting for something..."
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .lightGray
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(){
        print(statusTextField.text ?? "Waiting for something...")
        statusTextField.resignFirstResponder()
        statusTextField.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        setStatusButton.setTitle("Set status", for: .normal)
        myText.text = statusTextField.text
        contentView.addSubview(myText)
        let constrMyText: [NSLayoutConstraint] = [
            myText.centerXAnchor.constraint(equalTo: statusTextField.centerXAnchor),
            myText.topAnchor.constraint(equalTo: statusTextField.bottomAnchor),
            myText.heightAnchor.constraint(equalToConstant: 40),
            myText.widthAnchor.constraint(equalToConstant: 175)
        ]
        NSLayoutConstraint.activate(constrMyText)
        statusText = myText.text ?? "Waiting for something..."
    }
    
    func configureLayout() {
        avatarImageView.layer.cornerRadius = 50
        contentView.addSubviews([avatarImageView, fullNameLabel, statusTextField, setStatusButton])
        avatarImageView.snp.makeConstraints {
            (make) -> Void in
            make.top.equalToSuperview().inset(27)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(100)
        }
        fullNameLabel.snp.makeConstraints {
            (make) -> Void in
            make.leading.equalToSuperview().inset(132)
            make.top.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(175)
        }
        statusTextField.snp.makeConstraints {
            (make) -> Void in
            make.leading.equalTo(fullNameLabel)
            make.bottom.equalTo(setStatusButton).inset(84)
            make.height.equalTo(40)
            make.width.equalTo(175)
        }
        setStatusButton.snp.makeConstraints {
            (make) -> Void in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
