//
//  Locator.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 17.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import Foundation

protocol LocatorProtocol {
    var network: NetworkServiceProtocol { get set }
    var storage: StorageServiceProtocol { get set }
    init(network: NetworkServiceProtocol, storage: StorageServiceProtocol)
}

class Locator: LocatorProtocol {
    var network: NetworkServiceProtocol
    var storage: StorageServiceProtocol
    
    required init(network: NetworkServiceProtocol, storage: StorageServiceProtocol) {
        self.network = network
        self.storage = storage
    }
}
