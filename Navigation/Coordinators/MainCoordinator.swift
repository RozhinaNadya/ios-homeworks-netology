//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-05-10.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    private var window: UIWindow?
    private let scene: UIWindowScene
  //  private var tabBar = Checker.shared.rootController
    var feedCoordinator: FeedCoordinator?
    var loginCoordinator: LoginCoordinator?


    
    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        navigation.delegate = self
        initWindow()
    }
    
    var onComplete: (() -> Void)?
    
    init(scene: UIWindowScene) {
        navigation = UINavigationController()
        self.scene = scene
    }
    
    private func initWindow() {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let factory = MyLoginFactory()
    //    window.rootViewController = Checker.shared.createRootViewController(with: factory)
        window.rootViewController = createRootViewController(with: factory)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigation.transitionCoordinator?.viewController(forKey: .from) else {return}
        if navigation.viewControllers.contains(fromViewController) {return}
        if let feedViewController = fromViewController as? FeedViewController {
            childDidFinish(feedViewController.coordinator)
        }
    }
    
    func feedSubscription() {
        let child = FeedCoordinator(navigation: feedCoordinator!.navigation)
        childCoordinators.append(child)
        child.parentCoordinator = self
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
    
    func createRootViewController(with loginFactory: LoginFactory) -> UITabBarController {
        let factory = AppFactory()
        
        let tabBarModel = TabBarModel()
        
        feedCoordinator = FeedCoordinator(navigation: navigation)
        let feedNavController = factory.makeNavigationController(controller: feedCoordinator!.makeFeedController(), color: tabBarModel.color, title: tabBarModel.feedTitle)
        feedNavController.tabBarItem = factory.makeTabBarItem(title: tabBarModel.feedTitle, image: tabBarModel.feedImage)
        
        loginCoordinator = LoginCoordinator(navigation: navigation, loginFactory: loginFactory)
        let loginNavController = factory.makeNavigationController(controller: (loginCoordinator?.makeLogInController())!, color: tabBarModel.color, title: tabBarModel.logInTitle)
        loginNavController.tabBarItem = factory.makeTabBarItem(title: tabBarModel.logInTitle, image: tabBarModel.profileImage)
        
        return factory.makeTabBar(rootControllers: [feedNavController, loginNavController])
      }
    
}
