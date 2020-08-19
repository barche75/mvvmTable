//
//  MainViewData.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

enum MainViewData {
    case initial
    case loading
    case failure(Error)
    case success(DataModel)
    
    struct DataModel {
        var users: [User]
    }
}

struct User: Codable {
    let login: String
    let id: Int
    let avatarUrl: String
    let reposUrl: String
    let type: String
    let siteAdmin: Bool
}

