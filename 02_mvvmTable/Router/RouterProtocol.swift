//
//  RouterProtocol.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var assembler: AssemblerProtocol? { get set }
    
    func initialView()
    func pushDetailView(with user: User)
    func popToRoot()
}
