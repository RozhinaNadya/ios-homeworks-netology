//
//  NetworkServiceInfo.swift
//  Navigation
//
//  Created by Надежда on 2022-07-14.
//

import UIKit

enum NetworkErrors: Error {
    case serverError
    case unknownError
    case `default`
}

protocol NetworkServiceInfoProtocol {
    func request(url: URL, completion: @escaping (Result<Data, NetworkErrors>) -> Void)
}

final class NetworkServiceInfo {
    private let mainQueue = DispatchQueue.main
}

extension NetworkServiceInfo: NetworkServiceInfoProtocol {
    func request(url: URL, completion: @escaping (Result<Data, NetworkErrors>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            guard error == nil else {
                self.mainQueue.async {
                    completion(.failure(.default))
                }
                return
            }
            guard let data = data else {
                self.mainQueue.async {
                    completion(.failure(.unknownError))
                }
                return
            }
            self.mainQueue.async {
                completion(.success(data))
            }
        })
        task.resume()
    }
}
