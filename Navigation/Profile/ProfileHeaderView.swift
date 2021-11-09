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
    
    let statusTextPublic: UITextField = {
        let status = UITextField(frame: CGRect(x: 130, y: 60, width: 175, height: 40))
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
        status.backgroundColor = .lightGray
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    var statusButton: UIButton = {
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
    
   func configureLayout() {
       
        let views: [String: Any] = [
            "superView": self,
            "button": statusButton]
       
        var constrArray: [NSLayoutConstraint] = []
       
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[button]-16-|", metrics: nil, views: views)
        constrArray += NSLayoutConstraint.constraints(withVisualFormat: "V:|-135-[button(==50)]", metrics: nil, views: views)
       
        NSLayoutConstraint.activate(constrArray)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(labelName)
        addSubview(avatar)
        addSubview(statusTextPublic)
        addSubview(statusButton)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(){
        print(statusTextPublic.text as Any)
        statusTextPublic.resignFirstResponder()
        statusTextPublic.text = statusText
    }
    
    let myText: UITextField = {
        let text = UITextField(frame: CGRect(x: 130, y: 90, width: 175, height: 40))
        text.font = .systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        return text
    }()
    
    private var statusText: String = "Text"
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusButton.setTitle("Set status", for: .normal)
        
        myText.text = statusTextPublic.text
        
        addSubview(myText)

        statusText = myText.text ?? "Waiting for something..."
        
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
