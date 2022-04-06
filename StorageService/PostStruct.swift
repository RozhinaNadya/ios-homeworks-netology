//
//  Post.swift
//  Navigation
//
//  Created by Надежда on 26.01.2022.
//

import UIKit

public struct Post: Codable {
    public var author: String
    public var description: String
    public var image: String
    public var like: Int
    public var views: Int
  }
