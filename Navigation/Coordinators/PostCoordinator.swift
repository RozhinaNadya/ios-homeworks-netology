//
//  PostCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-06-01.
//

import UIKit

class PostCoordinator: Coordinator {
    
    weak var parentCoordinator: FeedCoordinator?

    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        print("vcPost start")
        let vcPost = PostViewController(.yellow, title: "Новый пост")
        navigation.pushViewController(vcPost, animated: true)
    }
        
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
