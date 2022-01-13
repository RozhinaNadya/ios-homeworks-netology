//
//  TableViewCell.swift
//  Navigation
//
//  Created by Надежда on 21.12.2021.
//

import UIKit

import UIKit

struct Post: Codable {
    var author: String
    var description: String
    var image: String
    var like: Int
    var views: Int
  }

class ProfileTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayoutProfile()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileHeaderView = ProfileHeaderView()
    
    func configureLayoutProfile() {
        contentView.addSubview(profileHeaderView)
        profileHeaderView.toAutoLayout()
        
        let constrProfile = [
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        NSLayoutConstraint.activate(constrProfile)
    }
    
}

class MyTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([authorLabel, descriptionLabel, postImageView, likeLabel, viewsLabel])
        configureLayoutPost()
    }
    
    var authorLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.toAutoLayout()
        aLabel.backgroundColor = .white
        aLabel.font = .systemFont(ofSize: 16, weight: .bold)
        aLabel.textColor = .black
        return aLabel
    }()
    
    var descriptionLabel: UILabel = {
        let dLabel = UILabel()
        dLabel.toAutoLayout()
        dLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dLabel.textColor = .gray
        dLabel.backgroundColor = .lightGray
        return dLabel
    }()
    
    var postImageView: UIImageView = {
        let iView = UIImageView()
        iView.toAutoLayout()
        return iView
    }()
    
    var likeLabel: UILabel = {
        let lLabel = UILabel()
        lLabel.toAutoLayout()
        lLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lLabel.textColor = .black
        return lLabel
    }()
    
    var viewsLabel: UILabel = {
        let vLabel = UILabel()
        vLabel.toAutoLayout()
        vLabel.font = .systemFont(ofSize: 14, weight: .regular)
        vLabel.textColor = .black
        return vLabel
    }()
    
    func configureLayoutPost() {
        let constrPost = [
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo: authorLabel.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likeLabel.leftAnchor.constraint(equalTo: leftAnchor),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsLabel.rightAnchor.constraint(equalTo: rightAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constrPost)
    }
    
/*    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    } */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 /*   override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    } */
    
}
