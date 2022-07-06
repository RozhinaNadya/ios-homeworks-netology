//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 13.01.2022.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewHeaderFooterView {
    
    private var statusText: String = "Waiting for something..."
    
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
        status.placeholder = self.statusText
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    lazy var setStatusButton: CustomButton = {
        let button = CustomButton(title: "Show status")
        button.onTap = {
            self.statusTextField.resignFirstResponder()
            self.statusTextField.text = self.statusText
            self.myText.isHidden = true
        }
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
        
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .lightGray
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        self.myText.isHidden = false
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
        guard let newStatus = myText.text else {return ApiError().handle(error: .notFound(element: "myText.text"))}
        statusText = newStatus
    }
    
    func configureLayout() {
        avatarImageView.layer.cornerRadius = 50
        contentView.addSubviews([avatarImageView, fullNameLabel, statusTextField, setStatusButton])
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(100)
        }
        fullNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(132)
            $0.top.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(175)
        }
        statusTextField.snp.makeConstraints {
            $0.leading.equalTo(fullNameLabel)
            $0.bottom.equalTo(setStatusButton).inset(84)
            $0.height.equalTo(40)
            $0.width.equalTo(175)
        }
        setStatusButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
