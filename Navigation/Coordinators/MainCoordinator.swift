//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-05-10.
//

import UIKit

class MainCoordinator: Coordinator {
    
    private var window: UIWindow?
    private let scene: UIWindowScene
    private var tabBar = Checker.shared.rootController
    
    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        initWindow()
    }
    
    var onComplete: (() -> Void)?
    
    init(scene: UIWindowScene) {
        navigation = UINavigationController()
        self.scene = scene
    }
    
    private func initWindow() {
        let window = UIWindow(windowScene: scene)
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
        self.window = window
    }
}