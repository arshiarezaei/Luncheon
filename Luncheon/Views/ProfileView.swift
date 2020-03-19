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
    private let credit : CreditView = CreditView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //        debugPrint("init")
        
        self.addSubview(nameAndPicView)
        setupNameAndPicView()
        
        self.addSubview(credit)
        setupCreditView()
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
        credit.translatesAutoresizingMaskIntoConstraints = false
        credit.backgroundColor = .white
        credit.layer.borderWidth = 1
        credit.layer.borderColor = UIColor.lightGray.cgColor
        credit.layer.cornerRadius = 16
        
        
        NSLayoutConstraint.activate([
            credit.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            credit.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            credit.topAnchor.constraint(equalTo: nameAndPicView.bottomAnchor, constant: 16),
            credit.heightAnchor.constraint(equalToConstant: 86)
        ])
    }
    
}
