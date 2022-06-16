//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Надежда on 19.01.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var profileModel: PhotosModel?
    
    let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let cellPhotosCollectionID = "PhotosCell"
    
    var backgroundColor: UIColor = .clear
    
    private var publisherImages: [UIImage] = []
    
    let imagePublisherFacadeObject = ImagePublisherFacade()
    
    let imageProcessor = ImageProcessor()
        
    deinit {
        imagePublisherFacadeObject.rechargeImageLibrary()
        imagePublisherFacadeObject.removeSubscription(for: self)
        }
    
    init(viewModel: PhotosModel) {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = viewModel.color
        self.title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.toAutoLayout()
        self.view.addSubview(self.photosCollectionView)
        configureLayoutPhotos()
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellPhotosCollectionID)
        self.navigationController?.navigationBar.isHidden = false
        imagePublisherFacadeObject.subscribe(self)
        imagePublisherFacadeObject.addImagesWithTimer(time: 0.1, repeat: 10)
        receive(images: dataPhotosSafely)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func configureLayoutPhotos() {
        let constrPhotos = [
            photosCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            photosCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
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
        return publisherImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPhotosCollectionID, for: indexPath) as! PhotosCollectionViewCell
        cell.photosImageView.image = publisherImages[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        let startTime = CFAbsoluteTimeGetCurrent()
        self.imageProcessor.processImagesOnThread(sourceImages: images, filter: .chrome, qos: .utility, completion: {images in
            DispatchQueue.main.async {
                images.forEach {
                    guard let img = $0 else {return}
                    self.publisherImages.append(UIImage(cgImage: img))
                }
                let finishTime = CFAbsoluteTimeGetCurrent()
                let time = finishTime - startTime
                print("time: \(time)")
                self.photosCollectionView.reloadData()
                // when filter: .chrome, qos: .utility – time: 26.586019039154053
                // when filter: .noir, qos: .utility – time: 36.0049329996109
                // when filter: .chrome, qos: .background – time: 115.93350791931152
                // when filter: .chrome, qos: .userInitiated – time: 39.15327799320221
            }
        })
    }
}
