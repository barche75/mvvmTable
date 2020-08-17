//
//  Assembler.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

protocol AssemblerProtocol {
    func mainView() -> UIViewController
}

class Assembler: AssemblerProtocol {
    
    func mainView() -> UIViewController {
        let view = MainView()
        view.vm = MainViewViewModel()
        return view
    }
}
