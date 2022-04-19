//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Надежда on 08.04.2022.
//

import UIKit

class CurrentUserService: UserService {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func giveUser(name: String) -> User? {
        if user.fullName == name {
            return user
        } else {
            return nil
        }
    }
}

