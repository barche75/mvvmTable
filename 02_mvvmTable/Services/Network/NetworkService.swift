//
//  NetworkServese.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    internal var token = ""
    
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
    
    func getUserAvatar(from urlString: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkErrors.wrongUrl))
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        session.resume()
    }
    
    func getUserBio(_ name: String, completion: @escaping (Result<UserDetails, Error>) -> ()) {
        let urlString = "https://api.github.com/users/\(name)"
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
                    if let userDetails = try? JSONDecoder().decode(UserDetails.self, from: data) {
                        completion(.success(userDetails))
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
