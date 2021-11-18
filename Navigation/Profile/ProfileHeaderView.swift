//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Надежда on 02.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var fullNameLabel: UILabel = {
       //let label = UILabel(frame: CGRect(x: 130, y: 27, width: 175, height: 40))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Икскотер"
        return label
    }()

    var avatarImageView: UIImageView = {
        let imageName = "catImage.png"
        let avatarImage = UIImage(named: imageName)
        let avatarView = UIImageView(image: avatarImage)
       // avatarView.frame = CGRect(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        
        avatarView.clipsToBounds = true
        return avatarView
    }()
    
    var statusTextField: UITextField = {
       //let status = UITextField(frame: CGRect(x: 130, y: 60, width: 175, height: 40))
        let status = UITextField()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
        status.backgroundColor = .lightGray
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.addShadow()
        return button
        }()
    
    var myText: UITextField = {
       // let text = UITextField(frame: CGRect(x: 130, y: 90, width: 175, height: 40))
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        return text
    }()
    
    private var statusText: String = "Text"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        configureLayout()
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(){
        print(statusTextField.text as Any)
        statusTextField.resignFirstResponder()
        statusTextField.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        setStatusButton.setTitle("Set status", for: .normal)
        myText.text = statusTextField.text
        addSubview(myText)
        let constrMyText: [NSLayoutConstraint] = [
            myText.centerXAnchor.constraint(equalTo: statusTextField.centerXAnchor),
            myText.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 5),
            myText.heightAnchor.constraint(equalToConstant: 40),
            myText.widthAnchor.constraint(equalToConstant: 175)
        ]
        NSLayoutConstraint.activate(constrMyText)
        
        statusText = myText.text ?? "Waiting for something..."
    }
    
    func configureLayout() {
        
        addSubview(avatarImageView)
        avatarImageView.layer.cornerRadius = 50
        addSubview(fullNameLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        
        let constrArray: [NSLayoutConstraint] = [
             
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

             
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
          //  fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 40),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 175),
             
            //statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 10),
           
            statusTextField.leftAnchor.constraint(equalTo: fullNameLabel.leftAnchor),
          //  statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
           // statusTextField.firstBaselineAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.widthAnchor.constraint(equalToConstant: 175),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
           // setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 34),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
         ]
        
        NSLayoutConstraint.activate(constrArray)
        
      setNeedsLayout()
      layoutIfNeeded()
     }
}

extension UIView {
  func addShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = .init(width: 4, height: 4)
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 0.7
  }
}
