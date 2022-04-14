//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Надежда on 08.04.2022.
//

import UIKit

class CurrentUserService: UserService {
    
    var user: User?
    
    func giveUser(name: String) -> User {
        if user?.fullName == name {
        return user!
        } else {
            print("Пользователь не найден, создан новый пользователь")
            let user2 = User(fullName: name, avatar: UIImageView(image: UIImage(named: "not_found")), status: "Waiting for something...")
            return user2
        }
    }
}

