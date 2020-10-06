//
//  DropDownMenu.swift
//  Luncheon
//
//  Created by arshiya on 10/6/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class DropDownMenu: UIView {
    
    private let titleLabel:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.semanticContentAttribute = .forceRightToLeft
        l.font = UIFont(name: UIFont.BYekan.fontName, size: 16)
        l.numberOfLines = 1
        l.contentMode = .right
        l.text = "عنوان"
        l.textColor = .luncheonGray
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // add titleLabel
        self.addSubview(titleLabel)
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 25 ),
        ])
    }
}
