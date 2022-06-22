//
//  Checker.swift
//  Navigation
//
//  Created by Надежда on 2022-04-19.
//

import UIKit

final class Checker {
    
    static var shared: Checker { Checker() }
    
    //MARK: Данные для входа
    private let loginChecker = "Login"
    private let pswdChecker = "Pass"
    
    private init() {
    }
    
    func checkYourLoginPassword(login: String, password: String) -> Bool {
        guard login == loginChecker, password == pswdChecker else { return false }
        return true
    }
}
