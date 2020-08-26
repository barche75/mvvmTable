//
//  Assembler.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class Assembler: AssemblerProtocol {
    var locator: LocatorProtocol
    
    init() {
        let networkService = NetworkService()
        let storageService = StorageService()
        locator = Locator(network: networkService, storage: storageService)
    }
    
    func mainView(router: RouterProtocol) -> UIViewController {
        let view = MainView()
        let viewModel = MainViewViewModel(router: router, locator: locator)
        view.vm = viewModel
        return view
    }
    
    func detailView(user: User, router: RouterProtocol) -> UIViewController {
        let view = DetailView()
        let viewModel = DetailViewViewModel(user: user, router: router, locator: locator)
        view.vm = viewModel
        return view
    }
}
