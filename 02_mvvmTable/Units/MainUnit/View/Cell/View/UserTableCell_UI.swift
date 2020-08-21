//
//  UserTableCell_UI.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

extension UserTableCell {
    
    func setupUI() {
        self.selectionStyle = .none
        self.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        bgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bgView.backgroundColor = .systemGray5
        bgView.layer.cornerRadius = 8
        
        bgView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 8).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: bgView.heightAnchor, constant: -16).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor).isActive = true
        avatarImageView.layer.cornerRadius = 42
        avatarImageView.layer.masksToBounds = true
        avatarImageView.backgroundColor = .white
        avatarImageView.contentMode = .scaleAspectFit
        
        bgView.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.bottomAnchor.constraint(equalTo: bgView.centerYAnchor, constant: -8).isActive = true
        loginLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
        loginLabel.widthAnchor.constraint(lessThanOrEqualTo: bgView.widthAnchor, constant: -8).isActive = true
        loginLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        bgView.addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.topAnchor.constraint(equalTo: bgView.centerYAnchor, constant: 8).isActive = true
        idLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 14).isActive = true
        idLabel.leftAnchor.constraint(lessThanOrEqualTo: loginLabel.leftAnchor).isActive = true
        idLabel.widthAnchor.constraint(lessThanOrEqualTo: bgView.widthAnchor, constant: -8).isActive = true
        idLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
    }
    
    func showContent() {
        switch viewData {
        case .initial:
            avatarImageView.image = UIImage()
            loginLabel.text = ""
            idLabel.text = ""
            
        case .loading(let viewData):
            let image = viewData.image
            avatarImageView.image = image
            loginLabel.text = viewData.login
            idLabel.text = "\(viewData.id)"
            
        case .failure(let viewData):
            let image = viewData.image
            avatarImageView.image = image
            loginLabel.text = viewData.login
            idLabel.text = "\(viewData.id)"
            
        case .success(let viewData):
            let image = viewData.image
            avatarImageView.image = image
            loginLabel.text = viewData.login
            idLabel.text = "ID \(viewData.id)"
        }
    }
}
