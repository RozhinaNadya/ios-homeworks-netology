//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-06-01.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        navigation.pushViewController(makeFeedController(), animated: true)
    }
    
    func makeFeedController() -> UIViewController {
        return TypeOfViewControllerFactory.makeViewController(.feed)()
    }
    
    var onComplete: (() -> Void)?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func postSubscription() {
        print("postSubscription work")
        guard let navPost = self.makeFeedController().navigationController else {return print("not found navigation")}
        let child = PostCoordinator(navigation: navPost)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
