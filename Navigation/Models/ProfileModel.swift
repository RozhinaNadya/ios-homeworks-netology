//
//  ProfileModel.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

class ProfileModel {

    let title: String = "Profile"
    var color: UIColor = .white
    var userService: UserService
    var userName: String
    
    init(userName: String, userService: UserService){
        self.userName = userName
        self.userService = userService
    }
}
