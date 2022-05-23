//
//  Checker.swift
//  Navigation
//
//  Created by Надежда on 2022-04-19.
//

import UIKit

final class Checker {
    
    static var shared: Checker { Checker() }
    
    //MARK: Данные для входа
    private let loginChecker = "Ivan"
    private let pswdChecker = "StrongPassword"
    
    var rootController = UITabBarController()
    
    private let factory = AppFactory()
    
    private init() {
    }
    
    func checkYourLoginPassword(login: String, password: String) -> Bool {
        guard login == loginChecker, password == pswdChecker else { return false }
        return true
    }
    
    func createRootViewController(with loginFactory: LoginFactory) -> UITabBarController {
        let feedController = FeedViewController(viewModel: FeedModel())
        let profileController = LogInViewController(inspector: loginFactory.returnLoginInspector())
        
        let feedNavController = factory.makeNavigationController(controller: feedController, color: .white, title: "Feed")
        feedNavController.tabBarItem = factory.makeTabBarItem(title: "Feed", image: UIImage(systemName: "house")!)
        
        let profileNavController = factory.makeNavigationController(controller: profileController, color: .white, title: "Log in")
        profileNavController.tabBarItem = factory.makeTabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle")!)
        
        return factory.makeTabBar(rootControllers: [feedNavController, profileNavController])
    }
}
