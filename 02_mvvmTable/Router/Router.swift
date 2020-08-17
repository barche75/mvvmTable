//
//  Router.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController! { get set }
    var assembler: AssemblerProtocol! { get set }
    
    init(navigationController: UINavigationController, assembler: AssemblerProtocol)
    
    func start() -> UIViewController
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController!
    var assembler: AssemblerProtocol!
    
    required init(navigationController: UINavigationController, assembler: AssemblerProtocol) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
    func start() -> UIViewController {
        return assembler.mainView()
    }
}
