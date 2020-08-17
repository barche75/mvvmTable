//
//  ViewController.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    var vm: MainViewViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension MainView: MainViewType {
    
}

