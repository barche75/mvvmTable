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
        view.backgroundColor = .white
        let item = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(fetchUsers))
        navigationItem.rightBarButtonItem = item
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableCell.self, forCellReuseIdentifier: UserTableCell.id)
        
        view.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTitle.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 1
        labelTitle.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        view.addSubview(labelDescription)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.topAnchor.constraint(equalToSystemSpacingBelow: labelTitle.bottomAnchor, multiplier: 1).isActive = true
        labelDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelDescription.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        labelDescription.textAlignment = .center
        labelDescription.numberOfLines = 0
        labelDescription.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(activityIndicator)
        activityIndicator.style = .medium
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: labelDescription.bottomAnchor, multiplier: 1).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
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
        case .loading(let data):
            tableView.isHidden = true
            tableView.reloadData()
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
            activityIndicator.stopAnimating()
            tableView.reloadData()
        }
    }
}
