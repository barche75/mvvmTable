//
//  AssemblerProtocol.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

protocol AssemblerProtocol {
    var locator: LocatorProtocol { get set }
    func mainView(router: RouterProtocol) -> UIViewController
    func detailView(state: Any?, router: RouterProtocol) -> UIViewController
}
