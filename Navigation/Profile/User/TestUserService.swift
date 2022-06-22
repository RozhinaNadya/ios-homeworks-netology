//
//  TestUserService.swift
//  Navigation
//
//  Created by Надежда on 2022-04-19.
//

import UIKit

class TestUserService: UserService {
    
    private let user = User(fullName: "Ivan Ivanov", avatarImageName: "myImage.png", status: "Hi! Can I help you?")
    
    func giveUser(name: String) -> User? {
            return user
    }
    
    
}
