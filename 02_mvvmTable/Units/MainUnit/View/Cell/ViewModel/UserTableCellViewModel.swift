//
//  UserTableCellViewModel.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class UserTableCellViewModel: UserTableCellViewModelType {
    public var userTableCellViewData: ((UserTableCellViewData) -> ())?
    var user: User
    var locator: LocatorProtocol
    
    required init(user: User, locator: LocatorProtocol) {
        self.userTableCellViewData?(.initial)
        self.user = user
        self.locator = locator
    }
    
    func stupCellContent() {
        let imageDefault = UIImage(systemName: "person.crop.circle.badge.xmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal) ?? UIImage()
        userTableCellViewData?(.loading(UserTableCellViewData.DataModel(image: imageDefault, login: "loading...", id: "loading...")))
        
        let id = user.id ?? 0 > 0 ? "\(user.id!)" : "no ID"
        let login = user.login ?? "no login"
        
        if let urlString = user.avatarUrl {
            locator.network.getUserAvatar(from: urlString) { [weak self] result in
                guard let self = self else { return }
                
                var image: UIImage?
                switch result {
                case .success(let data):
                    image = UIImage(data: data)
                case .failure(let error):
                    print(error.localizedDescription)
                    image = nil
                }
                
                if let image = image {
                    self.userTableCellViewData?(.success(UserTableCellViewData.DataModel(image: image, login: login, id: id)))
                } else {
                    self.userTableCellViewData?(.success(UserTableCellViewData.DataModel(image: imageDefault, login: login, id: id)))
                }
            }
        }  else {
            userTableCellViewData?(.success(UserTableCellViewData.DataModel(image: imageDefault, login: login, id: id)))
        }
    }
}


//mainViewData?(.loading(MainViewData.DataModel(title: "Loading", description: "please wait")))
