//
//  PhotosCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

class PhotosCoordinator: Coordinator {
    var navigation: UINavigationController
    
    var viewController: UIViewController
    
    var childCoordinators: [Coordinator] = []
    
   func start() {
        let photosViewController = TypeOfViewControllerFactory.makeViewController(.photos)
        viewController.navigationController?.pushViewController(photosViewController(), animated: true)
    }
  
    var onComplete: (() -> Void)?
    
    init(viewController: UIViewController) {
        navigation = UINavigationController()
        self.viewController = viewController
    }
}
