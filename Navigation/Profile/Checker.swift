//
//  Checker.swift
//  Navigation
//
//  Created by Надежда on 2022-04-19.
//

import UIKit

final class Checker {
    
    static var shared: Checker { Checker() }
    
    private let loginChecker = "Vasily"
    private let pswdChecker = "StrongPassword"
    
    private init() {}
    
    func checkYourLoginPassword(login: String, password: String) -> Bool {
        guard login == loginChecker, password == pswdChecker else { return false }
        return true
    }
}
