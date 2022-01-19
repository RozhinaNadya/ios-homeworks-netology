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
        label.text = "Photos"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    var photosIcon: UIImageView = {
        var icon = UIImageView(image: UIImage(systemName: "arrow.right"))
        return icon
    }()
    
    
    
}
