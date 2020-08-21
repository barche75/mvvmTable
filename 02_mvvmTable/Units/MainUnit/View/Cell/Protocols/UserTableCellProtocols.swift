//
//  UserTableCellProtocols.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol UserTableCellViewModelType {
    var userTableCellViewData: ((UserTableCellViewData) -> ())? { get set }
    var user: User { get set }
    init(user: User, locator: LocatorProtocol)
    func setupCellContent()
}
