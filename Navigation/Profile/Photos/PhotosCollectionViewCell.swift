//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Надежда on 25.01.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photosImageView: UIImageView = {
        let iView = UIImageView()
        iView.toAutoLayout()
        return iView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.contentView.addSubview(photosImageView)
        configureLayoutPhotos()
    }
    
    func configureLayoutPhotos() {
        let constrPhoto = [
            photosImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photosImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            photosImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            photosImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrPhoto)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
