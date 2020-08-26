
//
//  NetworkServiceProtocol.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 24.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    var token: String { get }
    func getUsers(completion: @escaping (Result<[User], Error>) -> ())
    func getUserAvatar(from urlString: String, completion: @escaping (Result<Data, Error>) -> ())
    func getUserBio(_ name: String, completion: @escaping (Result<UserDetails, Error>) -> ())
}
