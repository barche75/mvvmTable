//
//  NetworkServese.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    var token: String { get }
    func getUsers(completion: @escaping (Result<[User], Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    internal var token = "67606e6bdb4d507c717da5d9e06e6a008feb7869"
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> ()) {
        let urlString = "https://api.github.com/users"
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    if let users = try? JSONDecoder().decode([User].self, from: data) {
                        completion(.success(users))
                    } else {
                        completion(.failure(NetworkErrors.cantDecodeData))
                    }
                } else {
                    completion(.failure(NetworkErrors.dataCorrupted))
                }
            }
            task.resume()
        } else {
            completion(.failure(NetworkErrors.wrongUrl))
        }
    }
}

enum NetworkErrors: Error {
    case initial
    case wrongUrl
    case dataCorrupted
    case cantDecodeData
}
