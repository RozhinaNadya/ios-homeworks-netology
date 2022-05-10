//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Надежда on 2022-04-20.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func checkLoginPassword(login: String, password: String) -> Bool
}
