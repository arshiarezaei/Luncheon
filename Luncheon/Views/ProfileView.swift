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
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        debugPrint("init")
        self.addSubview(nameAndPicView)
        setupNameAndPicView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameAndPicView() {
        nameAndPicView.translatesAutoresizingMaskIntoConstraints = false
        nameAndPicView.layer.cornerRadius = nameAndPicView.frame.size.width/2
        nameAndPicView.backgroundColor = .white
        nameAndPicView.layer.borderWidth = 1
        nameAndPicView.layer.borderColor = UIColor.lightGray.cgColor
        nameAndPicView.layer.cornerRadius = 16

        
        NSLayoutConstraint.activate([
            nameAndPicView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            nameAndPicView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameAndPicView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameAndPicView.heightAnchor.constraint(equalToConstant: 153)
        ])
    }
    
}
