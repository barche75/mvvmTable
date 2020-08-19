//
//  Assembler.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

protocol AssemblerProtocol {
    var locator: LocatorProtocol { get set }
    func mainView(router: RouterProtocol) -> UIViewController
    func detailView(state: Any?, router: RouterProtocol) -> UIViewController
}

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
    
    func detailView(state: Any?, router: RouterProtocol) -> UIViewController {
        return UIViewController()
    }
}
