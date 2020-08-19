//
//  MainView_UI.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

extension MainView {
    
    func setupUI() {
        title = "Git users"
    }
    
    override func viewWillLayoutSubviews() {
        switch viewData {
        case .initial:
            view.backgroundColor = .systemGray6
            break
        case .loading:
            break
        case .failure(_):
            view.backgroundColor = .systemPink
            break
        case .success(_):
            view.backgroundColor = .systemGreen
            break
        }
    }
    
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.addSubview(tableView)
        return tableView
    }
    
    func makeLabelTitle() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.addSubview(label)
        return label
    }
    
    func makeLabelDescription() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: labelTitle.bottomAnchor, multiplier: 2).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.addSubview(label)
        return label
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .medium)
        ai.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ai.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ai.hidesWhenStopped = true
        view.addSubview(ai)
        return ai
    }
    
}
