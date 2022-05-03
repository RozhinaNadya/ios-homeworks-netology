//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Надежда on 19.01.2022.
//

import UIKit
import iOSIntPackage

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
    let previewPhotosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let cellPhotosPreviewCollectionID = "PhotosCellPreview"
    
    private var publisherImages: [UIImage] = []
    
    let imagePublisherFacadeObject = ImagePublisherFacade()
        
    deinit {
        imagePublisherFacadeObject.rechargeImageLibrary()
        imagePublisherFacadeObject.removeSubscription(for: self)
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        previewPhotosCollectionView.register(PreviewPhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellPhotosPreviewCollectionID)
        previewPhotosCollectionView.delegate = self
        previewPhotosCollectionView.dataSource = self
        previewPhotosCollectionView.toAutoLayout()
        configureLayoutPhotosTable()
        imagePublisherFacadeObject.subscribe(self)
        imagePublisherFacadeObject.addImagesWithTimer(time: 0.1, repeat: dataPhotos.count)
    }
    
    func configureLayoutPhotosTable() {
        contentView.addSubviews([photosLabel, photosIcon, previewPhotosCollectionView])
        let constrPhotosTable = [
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosIcon.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            previewPhotosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            previewPhotosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            previewPhotosCollectionView.heightAnchor.constraint(equalToConstant: 100),
            previewPhotosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            previewPhotosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrPhotosTable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPhotosPreviewCollectionID, for: indexPath) as! PreviewPhotosCollectionViewCell
        cell.photosImageView.image = dataPhotos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (contentView.frame.width - 48) / 4, height: (contentView.frame.width - 48) / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension PhotosTableViewCell: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        images.forEach { dataPhotos.append($0) }
        previewPhotosCollectionView.reloadData()
    }
}
