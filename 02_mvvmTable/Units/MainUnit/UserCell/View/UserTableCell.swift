//
//  UserTableCell.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {
    
    static let id = "UserTableCell"
    
    var bgView = UIView(frame: .zero)
    var avatarImageView = UIImageView(frame: .zero)
    var loginLabel = UILabel(frame: .zero)
    var idLabel = UILabel(frame: .zero)
    
    var vm: UserTableCellViewModelType!
    
    var viewData: UserTableCellViewData = .initial {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showContent()
            }
        }
    }
    
    func configure(with viewModel: UserTableCellViewModelType) {
        vm = viewModel
        vm.userTableCellViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.viewData = viewData
        }
        setupUI()
        showContent()
        vm.setupCellContent()
    }
    
    override func prepareForReuse() {
        avatarImageView.image = UIImage()
        loginLabel.text = ""
        idLabel.text = ""
    }
}














//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
