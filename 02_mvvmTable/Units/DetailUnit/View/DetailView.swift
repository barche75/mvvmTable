//
//  DetailView.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    var labelTitle = UILabel(frame: .zero)
    var labelDescription = UILabel(frame: .zero)
    var activityIndicator = UIActivityIndicatorView(frame: .zero)
    
    var labelLogin = UILabel(frame: .zero)
    var labelId = UILabel(frame: .zero)
    var avatarImageView = UIImageView(frame: .zero)
    var labelName = UILabel(frame: .zero)
    var labelCompany = UILabel(frame: .zero)
    var labelLocation = UILabel(frame: .zero)
    var labelEmail = UILabel(frame: .zero)
    
    var vm: DetailViewViewModelType!
    
     var viewData: DetailViewData = .initial {
         didSet {
             DispatchQueue.main.async { [weak self] in
                 guard let self = self else { return }
                 self.showContent()
             }
         }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.detailViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.viewData = viewData
        }
        setupUI()
        vm.getUserBio()
    }
    
}
