//
//  TypeOfViewControllerFactory.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

enum TypeOfViewControllerFactory {
    case login
    case feed
    case profile(viewModel: ProfileModel)
    case info
    case photos
    
    func makeViewController() -> UIViewController {
        switch self {
        case .login:
            return LogInViewController()
        case .feed:
            return FeedViewController(viewModel: FeedModel())
        case .profile(let viewModel):
            return ProfileViewController(viewModel: viewModel)
        case .info:
            return InfoViewController()
        case .photos:
            return PhotosViewController(viewModel: PhotosModel())
        }
    }
}

