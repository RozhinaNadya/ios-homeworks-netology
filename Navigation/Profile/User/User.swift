//
//  User.swift
//  Navigation
//
//  Created by Надежда on 08.04.2022.
//

import UIKit

class User {
    
    var fullName: String?
    var avatar: UIImageView?
    var status: String?
    
    init(fullName: String) {
        self.fullName = fullName
    }
    
    init(fullName: String, avatar: UIImageView, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
