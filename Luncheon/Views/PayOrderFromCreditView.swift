//
//  PayOrderFromCreditView.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class PayOrderFromCreditView: UIView {
    
    private let userCreditTitleLabel:UILabel = {
        var ucl = UILabel(frame: .zero)
        ucl.translatesAutoresizingMaskIntoConstraints = false
        ucl.semanticContentAttribute = .forceRightToLeft
        ucl.contentMode = .right
        ucl.text = "اعتبار شما"
        ucl.font = UIFont(name: UIFont.BYekanName, size: 16)
        ucl.textColor = .luncheonGray
        return ucl
    }()
    
    private let useCreditOrNotSwitch:UISwitch = {
        var ucw = UISwitch(frame: .zero)
        ucw.translatesAutoresizingMaskIntoConstraints = false
        ucw.onTintColor = .luncehonLogoText
//        ucw.thumbTintColor
        ucw.addTarget(self, action: #selector(changed(_sender:)), for: .valueChanged)
        return ucw
    }()
    
    private let userCreditValueLabel:UILabel = {
        var ucl = UILabel(frame: .zero)
        ucl.translatesAutoresizingMaskIntoConstraints = false
        ucl.semanticContentAttribute = .forceRightToLeft
        ucl.contentMode = .right
        let creditValue = SampleUser.Credit
        ucl.text = "\(creditValue)"+"تومان"
        ucl.font = UIFont(name: UIFont.BYekanName, size: 25)
        ucl.textColor = .luncheonDarkBalck
        return ucl
    }()
    
    private let payByUserCreditLabel:UILabel = {
        var ucl = UILabel(frame: .zero)
        ucl.translatesAutoresizingMaskIntoConstraints = false
        ucl.semanticContentAttribute = .forceRightToLeft
        ucl.contentMode = .right
        ucl.text = "استفاده از اعتبار "
        ucl.font = UIFont(name: UIFont.BYekanName, size: 9)
        ucl.textColor = .luncheonDarkBalck
        return ucl
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add useCreditLabel
        self.addSubview(userCreditTitleLabel)
        setupUserCreditLabelConstraints()
        
        // ad useCredit
        self.addSubview(useCreditOrNotSwitch)
        setupUserCreditSwitchConstraints()
        
        // add creditValueLabel
        self.addSubview(userCreditValueLabel)
        setupUserCreditValueLabelConstraints()
        
        // add payByUserCreditLabel
        self.addSubview(payByUserCreditLabel)
        setupPayByUserCreditLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserCreditLabelConstraints(){
        NSLayoutConstraint.activate([
            userCreditTitleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
            userCreditTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16),
        ])
    }
    
    private func setupUserCreditSwitchConstraints(){
        NSLayoutConstraint.activate([
            useCreditOrNotSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            useCreditOrNotSwitch.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
            useCreditOrNotSwitch.heightAnchor.constraint(equalToConstant: 36),
            useCreditOrNotSwitch.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupUserCreditValueLabelConstraints(){
        NSLayoutConstraint.activate([
            userCreditValueLabel.topAnchor.constraint(equalTo: userCreditTitleLabel.bottomAnchor),
            userCreditValueLabel.rightAnchor.constraint(equalTo: userCreditTitleLabel.rightAnchor),
//            userCreditValueLabel.heightAnchor.constraint(equalToConstant: 36),
//            userCreditValueLabel.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupPayByUserCreditLabel(){
        NSLayoutConstraint.activate([
            payByUserCreditLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            payByUserCreditLabel.leftAnchor.constraint(equalTo:useCreditOrNotSwitch.rightAnchor,constant: 32),
//            userCreditValueLabel.heightAnchor.constraint(equalToConstant: 36),
//            userCreditValueLabel.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    @objc private func changed(_sender:UISwitch){
        debugPrint("changed")
    }
}
