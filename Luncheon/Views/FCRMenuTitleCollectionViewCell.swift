//
//  FCRMenuTitleCollectionViewCell.swift
//  Luncheon
//
//  Created by Arshiya on 1/23/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit

class FCRMenuTitleCollectionViewCell: UICollectionViewCell {
    
    let menuTitleLabel:UILabel = {
        let ml = UILabel()
        ml.translatesAutoresizingMaskIntoConstraints = false
        ml.font = UIFont.BYekan
        ml.textColor = .gray
        ml.textAlignment = .center
        ml.semanticContentAttribute = .forceRightToLeft
        ml.text = "عنوان"
        return ml
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(menuTitleLabel)
        setupMenuTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMenuTitleLabel() {
        NSLayoutConstraint.activate([
            menuTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            menuTitleLabel.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            menuTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
