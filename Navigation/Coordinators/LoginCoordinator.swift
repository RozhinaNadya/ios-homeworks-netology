//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-06-13.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var loginFactory: LoginFactory
    
    func start() {
        navigation.pushViewController(makeLogInController(), animated: true)
    }
    
    var onComplete: (() -> Void)?
    
    init(navigation: UINavigationController, loginFactory: LoginFactory) {
        self.navigation = navigation
        self.loginFactory = loginFactory
    }
    
    func makeLogInController() -> UIViewController {
        return TypeOfViewControllerFactory.makeViewController(.login(inspector: loginFactory.returnLoginInspector()))()
    }
}
