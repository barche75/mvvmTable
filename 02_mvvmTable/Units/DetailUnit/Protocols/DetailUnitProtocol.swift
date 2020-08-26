//
//  DetailUnitProtocol.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation


protocol DetailViewViewModelType {
    var detailViewData: ((DetailViewData) -> ())? { get set }
    var router: RouterProtocol { get set }
    var locator: LocatorProtocol { get set }
    var user: User { get set }
    
    init(user: User, router: RouterProtocol, locator: LocatorProtocol)
    
    func getUserBio()
    func goBack()
}
