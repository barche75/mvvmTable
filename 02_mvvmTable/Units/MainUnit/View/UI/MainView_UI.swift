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
        view.backgroundColor = .systemGray6
        let item = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(fetchUsers))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func fetchUsers() {
        vm.getUsers()
    }
    
    func showContent() {
        switch viewData {
        case .initial:
            tableView.isHidden = true
            labelTitle.isHidden = true
            labelDescription.isHidden = true
            activityIndicator.isHidden = true
        case .loading(let data):
            tableView.isHidden = true
            labelTitle.text = data.title ?? "no title"
            labelTitle.isHidden = false
            labelDescription.isHidden = false
            labelDescription.text = data.description ?? "no description"
            activityIndicator.startAnimating()
        case .failure(let data):
            tableView.isHidden = true
            labelTitle.text = data.title ?? "no title"
            labelTitle.isHidden = false
            labelDescription.isHidden = false
            labelDescription.text = data.description ?? "no details"
            activityIndicator.stopAnimating()
        case .success:
            tableView.isHidden = false
            labelTitle.isHidden = true
            labelDescription.isHidden = true
            activityIndicator.isHidden = true
        }
    }
    
    func makeTableView() -> UITableView {
        let table = UITableView(frame: .zero)
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        return table
    }
    
    func makeLabelTitle() -> UILabel {
        let label = UILabel(frame: .zero)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }
    
    func makeLabelDescription() -> UILabel {
        let label = UILabel(frame: .zero)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: labelTitle.bottomAnchor, multiplier: 2).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .medium)
        view.addSubview(ai)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ai.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ai.hidesWhenStopped = true
        return ai
    }
    
}
