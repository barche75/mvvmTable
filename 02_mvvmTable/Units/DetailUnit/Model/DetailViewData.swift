//
//  DetailViewViewData.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

enum DetailViewData {
    case initial
    case loading(DataModel)
    case failure(DataModel)
    case success(DataModel)
    
    struct DataModel {
        var title: String?
        var description: String?
        var userImage: UIImage?
        var userDetails: UserDetails?
    }
}

class UserDetails: Decodable {
    let login: String?
    let id: Int?
    let avatarUrl: String?
    let name: String?
    let company: String?
    let location: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case name
        case company
        case location
        case email
    }
}
