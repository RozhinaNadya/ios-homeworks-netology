//
//  NetworkService.swift
//  Navigation
//
//  Created by Надежда on 2022-07-11.
//

import UIKit

struct NetworkService {
    func request(of configuration: AppConfiguration) {
        
        let myUrl:URL
        
        switch configuration {
        case .people:
            myUrl = URL(string: "https://swapi.dev/api/people/8")!
        case .starships:
            myUrl = URL(string: "https://swapi.dev/api/starships/3")!
        case .planets:
            myUrl = URL(string: "https://swapi.dev/api/planets/5")!
        }
        
        let wifiSessionConfiguration = URLSessionConfiguration.default
        wifiSessionConfiguration.timeoutIntervalForResource = 10
        wifiSessionConfiguration.allowsCellularAccess = false
        let session = URLSession(configuration: wifiSessionConfiguration)
        
        let task = session.dataTask(with: myUrl) { data, response, error in
            if let data = data {
                print("Data URL: \(myUrl) is \(data)")
                print("Data encoding URL: \(myUrl) is \(String(data: data, encoding: .windowsCP1250)!)")
            }
            if let response = response as? HTTPURLResponse {
                print("Response statusCode is \(response.statusCode)")
                print("Response allHeaderFields is \(response.allHeaderFields)")
            }
            if error != nil {
                print("Error is \(error!.localizedDescription)")
            }
        }
        task.resume()
    }
}


