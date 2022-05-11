//
//  CommonFactory.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

class CommonFactory {
    
    enum TypeOfViewController {
        case login
        case feed(viewModel: FeedModel)
        case profile(viewModel: ProfileModel)
        case info
        case photos(viewModel: PhotosModel)
        
        func makeViewController() -> UIViewController {
            switch self {
            case .login:
                return LogInViewController()
            case .feed(let viewModel):
                return FeedViewController(viewModel: viewModel)
            case .profile(let viewModel):
                return ProfileViewController(viewModel: viewModel)
            case .info:
                return InfoViewController()
            case .photos(let viewModel):
                return PhotosViewController(viewModel: viewModel)
            }
        }
    }
}
