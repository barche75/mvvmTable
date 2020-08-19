//
//  MainUnitProtocols.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol MainViewViewModelType {
    var mainViewData: ((MainViewData) -> ())? { get set }
    var router: RouterProtocol { get set }
    var locator: LocatorProtocol { get set }
    
    init(router: RouterProtocol, locator: LocatorProtocol)
    
    func numberOfRows() -> Int
    func getUsers()
    func tapOnCell(_ indexPath: IndexPath)
}
