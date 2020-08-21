//
//  UserTableCellViewData.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

enum UserTableCellViewData {
    case initial
    case loading(DataModel)
    case failure(DataModel)
    case success(DataModel)
    
    struct DataModel {
        var image: UIImage
        var login: String
        var id: String
    }
}
