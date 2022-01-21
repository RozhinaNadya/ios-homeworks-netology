//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 19.01.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var photosLabel: UILabel = {
        var label = UILabel()
        label.toAutoLayout()
        label.text = "Photos"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    var photosIcon: UIImageView = {
        var icon = UIImageView(image: UIImage(systemName: "arrow.right"))
        icon.toAutoLayout()
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayoutPhotosTable()
    }
    
    func configureLayoutPhotosTable() {
        contentView.addSubviews([photosLabel, photosIcon])
        let constrPhotosTable = [
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            photosIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosIcon.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constrPhotosTable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
