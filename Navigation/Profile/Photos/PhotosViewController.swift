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
    
    let dataPhotos: [UIImage?] = [UIImage(named: "1.png"), UIImage(named: "2.png"), UIImage(named: "3.png"), UIImage(named: "4.png"), UIImage(named: "5.png"), UIImage(named: "6.png"), UIImage(named: "7.png"), UIImage(named: "8.png"), UIImage(named: "9.png"), UIImage(named: "10.png"), UIImage(named: "11.png"), UIImage(named: "12.png"), UIImage(named: "13.png"), UIImage(named: "14.png"), UIImage(named: "15.png"), UIImage(named: "16.png"), UIImage(named: "17.png"), UIImage(named: "18.png"), UIImage(named: "19.png"), UIImage(named: "20.png")]
    
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
            photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 8),
            photosCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constrPhotos)
    }
    
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
        return CGSize(width: (view.frame.width / 3 - 8), height: (view.frame.width / 3 - 8))
    }
    /*
       func collectionView(_ collectionView: UICollectionView,
     layout collectionViewLayout: UICollectionViewLayout,
     insetForSectionAt section: Int) -> UIEdgeInsets {
     return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
     }
     
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }*/
}
