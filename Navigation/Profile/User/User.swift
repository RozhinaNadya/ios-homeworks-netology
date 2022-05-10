//
//  User.swift
//  Navigation
//
//  Created by Надежда on 08.04.2022.
//

import UIKit

class User {
    
    var fullName: String?
    var avatarImageName: String?
    var status: String?
    
    init(fullName: String) {
        self.fullName = fullName
    }
    
    init(fullName: String, avatarImageName: String, status: String) {
        self.fullName = fullName
        self.avatarImageName = avatarImageName
        self.status = status
    }
}
