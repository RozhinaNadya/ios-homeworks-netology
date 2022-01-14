//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 13.01.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewHeaderFooterView {
    
 /*   let profileHeaderView = ProfileHeaderView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureLayoutProfile()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       func configureLayoutProfile() {
        contentView.addSubview(profileHeaderView)
        profileHeaderView.toAutoLayout()
        
        let constrProfile = [
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrProfile)
    }*/
    
    var fullNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Икскотер"
        return label
    }()
    
    var avatarImageView: UIImageView = {
        let imageName = "catImage.png"
        let avatarImage = UIImage(named: imageName)
        let avatarView = UIImageView(image: avatarImage)
        avatarView.toAutoLayout()
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.clipsToBounds = true
        return avatarView
    }()
    
    var statusTextField: UITextField = {
        let status = UITextField()
        status.toAutoLayout()
        status.font = .systemFont(ofSize: 14, weight: .regular)
      //  status.textColor = .gray
        status.text = "Waiting for something..."
        status.backgroundColor = .lightGray
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    var setStatusButton: UIButton = {
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
    
    var myText: UITextField = {
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
            myText.widthAnchor.constraint(equalToConstant: 175),
        //    myText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrMyText)
        statusText = myText.text ?? "Waiting for something..."
    }
    
    func configureLayout() {
        avatarImageView.layer.cornerRadius = 50
        contentView.addSubviews([avatarImageView, fullNameLabel, statusTextField, setStatusButton])
        let constrArray: [NSLayoutConstraint] = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            fullNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 40),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 175),
            
            statusTextField.leftAnchor.constraint(equalTo: fullNameLabel.leftAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 175),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constrArray)
    }
}
