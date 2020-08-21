//
//  MainViewViewModel.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

class MainViewViewModel: MainViewViewModelType {
    
    public var mainViewData: ((MainViewData) -> ())?
    var users: [User]
    
    var router: RouterProtocol
    var locator: LocatorProtocol
    
    required init(router: RouterProtocol, locator: LocatorProtocol) {
        self.mainViewData?(.initial)
        self.users = []
        self.router = router
        self.locator = locator
    }
    
    func numberOfRows() -> Int {
        return users.count
    }
    
    func getUsers() {
        users = []
        mainViewData?(.loading(MainViewData.DataModel(title: "Loading", description: "please wait")))
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.locator.network.getUsers { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let fetchedUsers):
                    self.users = fetchedUsers
                    self.mainViewData?(.success)
                case .failure:
                    self.mainViewData?(.failure(MainViewData.DataModel(title: "Warning", description: "error")))
                }
            }
        }
    }
    
    func tapOnCell(_ indexPath: IndexPath) {
        let user = users[indexPath.row]
        router.pushDetailView(with: user)
    }
    
    func provideCellViewModel(for indexPath: IndexPath) -> UserTableCellViewModelType {
        let user = users[indexPath.row]
        let model = UserTableCellViewModel(user: user, locator: locator)
        return model
    }
}
