//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Надежда on 2022-04-20.
//

import Foundation

class MyLoginFactory: LoginFactory {
    func returnLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
