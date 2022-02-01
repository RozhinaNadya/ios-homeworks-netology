//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Надежда on 19.01.2022.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let cellPhotosCollectionID = "PhotosCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.toAutoLayout()
        self.view.addSubview(self.photosCollectionView)
        configureLayoutPhotos()
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellPhotosCollectionID)
    }
    
    func configureLayoutPhotos() {
        let constrPhotos = [
            photosCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            photosCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            photosCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrPhotos)
    }
}

extension PhotosViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPhotosCollectionID, for: indexPath) as! PhotosCollectionViewCell
        cell.photosImageView.image = dataPhotos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width - 32) / 3, height: (self.view.frame.width - 32) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}
