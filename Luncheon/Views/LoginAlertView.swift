//
//  LoginAlertView.swift
//  Luncheon
//
//  Created by arshiya on 9/30/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class LoginAlertView: UIView {
    private var text:UILabel = {
        var l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "برای مشاهده این صفحه ابتدا وارد حساب کاربری خود شوید"
        l.numberOfLines = 0
        l.font = UIFont(name: UIFont.BYekan.fontName, size: 30)
        l.semanticContentAttribute = .forceRightToLeft
        l.textAlignment = .center
        return l
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // add label
        self.addSubview(text)
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupText() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            text.widthAnchor.constraint(equalTo: self.widthAnchor),
            text.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }

}
