//
//  DetailViewViewModel.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class DetailViewViewModel: DetailViewViewModelType {
    
    var detailViewData: ((DetailViewData) -> ())?
    var router: RouterProtocol
    var locator: LocatorProtocol
    var user: User
    
    required init(user: User, router: RouterProtocol, locator: LocatorProtocol) {
        self.detailViewData?(.initial)
        self.user = user
        self.router = router
        self.locator = locator
    }
    
    func getUserBio() {
        detailViewData?(.loading(DetailViewData.DataModel(title: "Loading",
                                                          description: "please wait...",
                                                          userImage: nil,
                                                          userDetails: nil)))
        guard let login = user.login else {
            detailViewData?(.failure(DetailViewData.DataModel(title: "Warning",
                                                              description: "something went wrong...",
                                                              userImage: nil,
                                                              userDetails: nil)))
            return
        }
        
        locator.network.getUserBio(login) { [weak self] result in
            guard let self = self else { return }
            let image = UIImage(systemName: "person.crop.circle.fill") ?? UIImage()
            switch result {
            case .success(let userDetails):
                if let avatarUrlString = userDetails.avatarUrl {
                    self.locator.network.getUserAvatar(from: avatarUrlString) { result in
                        switch result {
                        case .success(let data):
                            let userImage = UIImage(data: data) ?? image
                                self.detailViewData?(.success(DetailViewData.DataModel(title: nil,
                                                                                       description: nil,
                                                                                       userImage: userImage,
                                                                                       userDetails: userDetails)))
                        case .failure(_):
                            self.detailViewData?(.success(DetailViewData.DataModel(title: nil,
                                                                                   description: nil,
                                                                                   userImage: image,
                                                                                   userDetails: userDetails)))
                        }
                    }
                } else {
                    self.detailViewData?(.success(DetailViewData.DataModel(title: nil,
                                                                           description: nil,
                                                                           userImage: image,
                                                                           userDetails: userDetails)))
                }
            case .failure:
                self.detailViewData?(.failure(DetailViewData.DataModel(title: "Warning",
                                                                       description: "something went wrong...",
                                                                       userImage: nil,
                                                                       userDetails: nil)))
            }
        }
    }
    
    func goBack() {
        router.popToRoot()
    }
}
