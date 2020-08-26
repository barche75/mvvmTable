//
//  DetailView_UI.swift
//  02_mvvmTable
//
//  Created by Евгений Коузов on 21.08.2020.
//  Copyright © 2020 barche. All rights reserved.
//

import UIKit

extension DetailView {
    
    func setupUI() {
        title = "Bio"
        view.backgroundColor = .white
        setupSubviewsWhenSuccess()
        setupSubviewsWhenNotSuccess()
    }
    
    func showContent() {
        switch viewData {
        case .initial:
            view.subviews.forEach { $0.isHidden = true }
        case .loading(let viewData):
            showSubviewsWhenNotSuccess(with: viewData)
            activityIndicator.startAnimating()
        case .failure(let viewData):
            showSubviewsWhenNotSuccess(with: viewData)
            activityIndicator.stopAnimating()
        case .success(let viewData):
            showSubviewsWhenSuccess(with: viewData)
            activityIndicator.stopAnimating()
        }
    }
    
    func showSubviewsWhenSuccess(with dataModel: DetailViewData.DataModel) {
        let details = dataModel.userDetails
        view.subviews.forEach { $0.isHidden = true }
        labelLogin.isHidden = false
        labelLogin.text = "aka \(details?.login ?? "no login")"
        labelId.isHidden = false
        labelId.text = ", ID: \(details?.id ?? 0)"
        avatarImageView.isHidden = false
        avatarImageView.image = dataModel.userImage
        labelName.isHidden = false
        labelName.text = details?.name ?? "no name"
        labelCompany.isHidden = false
        labelCompany.text = details?.company ?? "no company"
        labelLocation.isHidden = false
        labelLocation.text = details?.location ?? "location unknown"
        labelEmail.isHidden = false
        labelEmail.text = details?.email ?? "no email address"
    }
    
    func showSubviewsWhenNotSuccess(with dataModel: DetailViewData.DataModel) {
        view.subviews.forEach { $0.isHidden = true }
        labelTitle.isHidden = false
        labelTitle.text = dataModel.title ?? "no title"
        labelDescription.isHidden = false
        labelDescription.text = dataModel.description ?? "no description"
    }
    
    func setupSubviewsWhenSuccess() {
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        avatarImageView.layer.cornerRadius = 100
        avatarImageView.layer.borderColor = UIColor.darkGray.cgColor
        avatarImageView.layer.borderWidth = 4
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        
        view.addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.topAnchor.constraint(equalToSystemSpacingBelow: avatarImageView.bottomAnchor, multiplier: 2).isActive = true
        labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelName.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelName.font = .systemFont(ofSize: 26, weight: .medium)
        
        view.addSubview(labelLogin)
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        labelLogin.topAnchor.constraint(equalToSystemSpacingBelow: labelName.bottomAnchor, multiplier: 1).isActive = true
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -16).isActive = true
        labelLogin.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelLogin.font = .systemFont(ofSize: 18, weight: .thin)
        
        view.addSubview(labelId)
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.topAnchor.constraint(equalToSystemSpacingBelow: labelName.bottomAnchor, multiplier: 1).isActive = true
        labelId.leftAnchor.constraint(equalTo: labelLogin.rightAnchor).isActive = true
        labelId.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelId.font = .systemFont(ofSize: 18, weight: .thin)
        
        view.addSubview(labelLocation)
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        labelLocation.topAnchor.constraint(equalToSystemSpacingBelow: labelLogin.bottomAnchor, multiplier: 2).isActive = true
        labelLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelLocation.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelLocation.font = .systemFont(ofSize: 24, weight: .light)
        
        view.addSubview(labelCompany)
        labelCompany.translatesAutoresizingMaskIntoConstraints = false
        labelCompany.topAnchor.constraint(equalToSystemSpacingBelow: labelLocation.bottomAnchor, multiplier: 1).isActive = true
        labelCompany.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelCompany.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelCompany.font = .systemFont(ofSize: 18, weight: .light)
        
        view.addSubview(labelEmail)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        labelEmail.topAnchor.constraint(equalToSystemSpacingBelow: labelCompany.bottomAnchor, multiplier: 1).isActive = true
        labelEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelEmail.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, constant: -32).isActive = true
        labelEmail.font = .systemFont(ofSize: 18, weight: .light)
    }
    
    func setupSubviewsWhenNotSuccess() {
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
}
