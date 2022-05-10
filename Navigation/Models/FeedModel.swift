//
//  FeedModel.swift
//  Navigation
//
//  Created by Надежда on 2022-05-09.
//

import UIKit

class FeedModel {
    
    var onTap: (() -> Void)?
    
    let password: String = "Password"
    
    func check(word: String) {
        onTap?()
    }
}
