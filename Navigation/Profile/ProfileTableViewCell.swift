//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 13.01.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewHeaderFooterView {
    
    let profileHeaderView = ProfileHeaderView()
    
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
            profileHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrProfile)
    }
}
