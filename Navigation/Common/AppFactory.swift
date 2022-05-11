//
//  AppFactory.swift
//  Navigation
//
//  Created by Надежда on 2022-04-20.
//

import UIKit

class AppFactory {
    
    func makeTabBar(rootControllers: [UIViewController]) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = rootControllers
        return tabBarController
    }
    
    func makeNavigationController(controller: UIViewController, color: UIColor, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.title = title
        navigationController.view.backgroundColor = color
        return navigationController
    }
    
    func makeTabBarItem(title: String, image: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = title
        tabBarItem.image = image
        
        return tabBarItem
    }
}
