//
//  Coordinator.swift
//  Navigation
//
//  Created by Надежда on 2022-05-10.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
    var onComplete: (() -> Void)? { get set }
}
