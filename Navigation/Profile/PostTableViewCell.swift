//
//  TableViewCell.swift
//  Navigation
//
//  Created by Надежда on 21.12.2021.
//

import UIKit

struct Post: Codable {
    var author: String
    var description: String
    var image: String
    var like: Int
    var views: Int
  }

class PostTableViewCell: UITableViewCell {
    
    var authorLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.toAutoLayout()
        aLabel.backgroundColor = .white
        aLabel.font = .systemFont(ofSize: 18, weight: .bold)
        aLabel.textColor = .black
        return aLabel
    }()
    
    var descriptionLabel: UILabel = {
        let dLabel = UILabel()
        dLabel.toAutoLayout()
        dLabel.font = .systemFont(ofSize: 16, weight: .regular)
        dLabel.textColor = .darkGray
        dLabel.backgroundColor = .white
        dLabel.numberOfLines = 0
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
        lLabel.font = .systemFont(ofSize: 16, weight: .regular)
        lLabel.textColor = .black
        return lLabel
    }()
    
    var viewsLabel: UILabel = {
        let vLabel = UILabel()
        vLabel.toAutoLayout()
        vLabel.font = .systemFont(ofSize: 16, weight: .regular)
        vLabel.textColor = .black
        return vLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([authorLabel, descriptionLabel, postImageView, likeLabel, viewsLabel])
        configureLayoutPost()
    }
    
    func configureLayoutPost() {
        let constrPost = [
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 320),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            likeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewsLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constrPost)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
