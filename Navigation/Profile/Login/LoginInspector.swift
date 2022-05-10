//
//  LoginInspector.swift
//  Navigation
//
//  Created by Надежда on 2022-04-19.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    func checkLoginPassword(login: String, password: String) -> Bool {
        Checker.shared.checkYourLoginPassword(login: login, password: password)
    }
    
    
}
