//
//  Router.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assembler: AssemblerProtocol?
    
    init(navigationController: UINavigationController, assembler: AssemblerProtocol) {
        self.navigationController = navigationController
        self.assembler = assembler
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .systemGreen
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func initialView() {
        guard let navigationController = navigationController else { return }
        guard let mainView = assembler?.mainView(router: self) else { return }
        navigationController.viewControllers = [mainView]
    }
    
    func pushDetailView(with state: Any?) {
        guard let navigationController = navigationController else { return }
        guard let detailView = assembler?.detailView(state: state, router: self) else { return }
        navigationController.pushViewController(detailView, animated: true)
    }
    
    func popToRoot() {
        navigationController?.popViewController(animated: true)
    }
}
