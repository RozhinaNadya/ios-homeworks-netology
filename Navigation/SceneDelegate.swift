//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Надежда on 19.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
  /*      let feedNavController = UINavigationController(rootViewController: FeedViewController(.gray, title: "Лента"))
        feedNavController.tabBarItem = UITabBarItem(title: "Лента", image:UIImage(systemName: "house"), selectedImage: nil)
        let profileNavController = UINavigationController(rootViewController: LogInViewController(.white, title: "Log in"))
        profileNavController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        
        window.rootViewController = TabBar(
            viewControllers: [
                feedNavController,
                profileNavController
            ]
        )*/
        
        window.rootViewController = Checker.shared.rootController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

