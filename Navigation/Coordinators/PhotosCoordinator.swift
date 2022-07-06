//
//  PhotosCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

class PhotosCoordinator: Coordinator {
    
    weak var parentCoordinator: ProfileCoordinator?
    
    var navigation: UINavigationController
        
    var childCoordinators: [Coordinator] = []
    
   func start() {
        let photosViewController = TypeOfViewControllerFactory.makeViewController(.photos)
        navigation.pushViewController(photosViewController(), animated: true)
    }
      
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}
