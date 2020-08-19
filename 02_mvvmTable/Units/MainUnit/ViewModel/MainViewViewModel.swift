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
        DispatchQueue.global().asyncAfter(deadline: .now() + 10) {
            self.locator.network.getUsers { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let fetchedUsers):
                    self.users = fetchedUsers
                    self.mainViewData?(.success(MainViewData.DataModel(users: fetchedUsers)))
                case .failure(let requestError):
                    self.mainViewData?(.failure(requestError)) //requestError
                }
            }
        }
    }
    
    func tapOnCell(_ indexPath: IndexPath) {
        let user = users[indexPath.row]
        router.pushDetailView(with: user)
    }
}
