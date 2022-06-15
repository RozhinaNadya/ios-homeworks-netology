//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-06-13.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    let loginFactory = MyLoginFactory()

    func start() {
        navigation.pushViewController(makeLogInController(), animated: true)
    }
        
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func makeLogInController() -> UIViewController {
        return TypeOfViewControllerFactory.makeViewController(.login(inspector: loginFactory.returnLoginInspector()))()
    }
    
    func profileSubscription(userName: String, userService: UserService) {
        print("profileSubscription work")
        let child = ProfileCoordinator(navigation: navigation, userName: userName, userService: userService)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
