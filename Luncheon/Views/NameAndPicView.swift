//
//  NameAndPicView.swift
//  Luncheon
//
//  Created by Arshiya on 12/29/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class NameAndPicView: UIView {
    
    private let profilePic:UIImageView = UIImageView()
    private let nameLabel:UILabel = UILabel()
    private let editProfileButton:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(profilePic)
        setupProfilePic()
        
        self.addSubview(nameLabel)
        setupName()
        
        self.addSubview(editProfileButton)
        setupEditProfileButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfilePic() {
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.layer.borderWidth = 1
        profilePic.layer.cornerRadius = 32
        profilePic.backgroundColor = .white
        profilePic.clipsToBounds = true
        profilePic.layer.borderColor = UIColor.lightGray.cgColor
        profilePic.image = UserStates.currentUserProfile?.profilePic?.withRenderingMode(.alwaysTemplate)
        profilePic.tintColor = .lightGray
        
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 64),
            profilePic.heightAnchor.constraint(equalToConstant: 64),
            profilePic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profilePic.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        ])
        
    }
    private func setupName() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = {
            if let name = UserStates.currentUserProfile?.fullName {
                debugPrint("class NameAndPicView->setupName if let ")
            return name
            }
            else{
                return "نام و نام خانوادگی"
            }
        }()
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.semanticContentAttribute = .forceRightToLeft
        nameLabel.font = UIFont.BYekan
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor,constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    private func setupEditProfileButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileButton.setTitleColor(.luncehonLogoText, for: .normal)
        editProfileButton.setTitle("ویرایش", for: .normal)
        editProfileButton.titleLabel?.font = UIFont(name: UIFont.BYekan.fontName, size: 20)
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            editProfileButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    func updateContent() {
        profilePic.image = UserStates.currentUserProfile?.profilePic
        nameLabel.text = {
//            if let name = UserProfile.fullName {
            return UserStates.currentUserProfile?.fullName
//            }
//            else{
//                return "نام و نام خانوادگی"
//            }
        }()
    }
    
}
