//
//  ViewController.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    var tableView = UITableView(frame: .zero)
    var labelTitle = UILabel(frame: .zero)
    var labelDescription = UILabel(frame: .zero)
    var activityIndicator = UIActivityIndicatorView(frame: .zero)
    
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
        vm.mainViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.viewData = viewData
        }
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        showContent()
    }
    
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableCell.id, for: indexPath) as! UserTableCell
        let cellViewModel = vm.provideCellViewModel(for: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.tapOnCell(indexPath)
    }
}

extension MainView: UITableViewDelegate {}

