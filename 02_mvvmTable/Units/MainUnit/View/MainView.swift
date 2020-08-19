//
//  ViewController.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    lazy var tableView = makeTableView()
    lazy var labelTitle = makeLabelTitle()
    lazy var labelDescription = makeLabelDescription()
    lazy var activityIndicator = makeActivityIndicator()
    
    var vm: MainViewViewModelType!
    
    var viewData: MainViewData = .initial {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showContent()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showContent()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        vm.mainViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.viewData = viewData
        }
    }    
    
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.tapOnCell(indexPath)
    }
}

extension MainView: UITableViewDelegate {}

