//
//  StorageServiceProtocol.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 24.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol StorageServiceProtocol {
    func saveUsers(_ users: [User]?)
    func fetchUsers() -> [User]
}
