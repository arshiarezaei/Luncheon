//
//  ProfileView.swift
//  Luncheon
//
//  Created by Arshiya on 12/29/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    private let nameAndPicView:NameAndPicView = NameAndPicView(frame: .zero)
    private let creditView : CreditView = CreditView(frame: .zero)
    private let logoutButton:UIButton = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //        debugPrint("init")
        
        self.addSubview(nameAndPicView)
        setupNameAndPicView()
        
        self.addSubview(creditView)
        setupCreditView()
        
        self.addSubview(logoutButton)
        setupLogoutButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNameAndPicView() {
        nameAndPicView.translatesAutoresizingMaskIntoConstraints = false
        nameAndPicView.backgroundColor = .white
        nameAndPicView.layer.borderWidth = 1
        nameAndPicView.layer.borderColor = UIColor.lightGray.cgColor
        nameAndPicView.layer.cornerRadius = 16
        
        
        NSLayoutConstraint.activate([
            nameAndPicView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            nameAndPicView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameAndPicView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameAndPicView.heightAnchor.constraint(equalToConstant: 153)
        ])
    }
    
    private func setupCreditView() {
        creditView.translatesAutoresizingMaskIntoConstraints = false
        creditView.backgroundColor = .white
        creditView.layer.borderWidth = 1
        creditView.layer.borderColor = UIColor.lightGray.cgColor
        creditView.layer.cornerRadius = 16
        
        
        NSLayoutConstraint.activate([
            creditView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            creditView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            creditView.topAnchor.constraint(equalTo: nameAndPicView.bottomAnchor, constant: 16),
            creditView.heightAnchor.constraint(equalToConstant: 86)
        ])
    }
    
    private func setupLogoutButton() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.backgroundColor = .luncehonLogoText
        logoutButton.layer.cornerRadius = 20
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string:"خروج", attributes: fontAttributes as [NSAttributedString.Key : Any])
        logoutButton.setAttributedTitle(title, for: .normal)
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: creditView.bottomAnchor, constant: 16),
            logoutButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
        
    }
    
    @objc private func logoutButtonTapped() {
        UserStates.changeStateToLoggedOut()
    }
    
}
