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
    case loading(DataModel)
    case failure(DataModel)
    case success
    
    struct DataModel {
        var title: String?
        var description: String?
    }
}

class User: Decodable {
    let login: String?
    let id: Int?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
    }
}
