//
//  NetworkService.swift
//  Navigation
//
//  Created by Надежда on 2022-07-11.
//

import UIKit

struct NetworkService {
    func goDataTaskURL(url: String) {
        
        if let myUrl = URL(string: url) {
            
            let wifiSessionConfiguration = URLSessionConfiguration.default
            wifiSessionConfiguration.timeoutIntervalForResource = 10
            wifiSessionConfiguration.allowsCellularAccess = false
            
            let task = URLSession.shared.dataTask(with: myUrl) { data, response, error in
                print("Server's data is: \(data.debugDescription)")
                print("Server's response is: \(response.debugDescription)")
            }
                task.resume()
        } else {
            ApiError().handle(error: .notFound(element: url))
        }
    }
}
