//
//  ApiError.swift
//  Navigation
//
//  Created by Надежда on 2022-06-28.
//

import UIKit

enum AppError: Error {
    case wrongPassword(viewController: UIViewController)
    case passwordEmpty(viewController: UIViewController)
    case loginEmpty(viewController: UIViewController)
    case notFound(element: String)
}

class ApiError {
    
    func handle(error: AppError) {
        switch error {
        case .wrongPassword(let viewController):
            let alert = UIAlertController(title: "Wrong login or password", message: "Please check the details and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            viewController.present(alert, animated: true, completion: nil)

        case .passwordEmpty(let viewController):
            let alert = UIAlertController(title: "Password is empty", message: "Please enter password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            viewController.present(alert, animated: true, completion: nil)
            
        case .loginEmpty(let viewController):
            let alert = UIAlertController(title: "Login is empty", message: "Please enter login", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            viewController.present(alert, animated: true, completion: nil)
            
        case .notFound(let element):
            print("Not found \(element)")
        }
    }
}
