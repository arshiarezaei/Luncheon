//
//  CreditView.swift
//  Luncheon
//
//  Created by Arshiya on 12/29/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class CreditView: UIView {
    
    private let yourCreditLabel:UILabel = UILabel(frame: .zero)
    private let yourCreditValue:UILabel = UILabel(frame: .zero)
    private let increaseCreditButton:UIButton = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.addSubview(yourCreditLabel)
        setupYourCredit()
        
        self.addSubview(yourCreditValue)
        setupYourCreditValueLabel()
        
        self.addSubview(increaseCreditButton)
        setupIncreaseCreditButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupYourCredit() {
        yourCreditLabel.translatesAutoresizingMaskIntoConstraints = false
        yourCreditLabel.textColor = UIColor.lightGray
        yourCreditLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        yourCreditLabel.textAlignment = .right
        yourCreditLabel.semanticContentAttribute = .forceRightToLeft
        yourCreditLabel.text = "اعتبار شما"
        //        yourCreditLabel.layer.borderColor = UIColor.black.cgColor
        //        yourCreditLabel.layer.borderWidth = 2
        
        NSLayoutConstraint.activate([
            //            yourCreditLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //            yourCreditLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            yourCreditLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            yourCreditLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        
    }
    
    private func setupYourCreditValueLabel() {
        yourCreditValue.translatesAutoresizingMaskIntoConstraints = false
        yourCreditValue.textColor = UIColor.black
        yourCreditValue.font = UIFont(name: UIFont.BYekanName, size: 20)
        yourCreditValue.textAlignment = .right
        yourCreditValue.semanticContentAttribute = .forceRightToLeft
        yourCreditValue.text = {
            let balance = UserStates.currentUserProfile!.credit / 10
            return "\(balance) تومان"
        }()
        
        
        NSLayoutConstraint.activate([
            //            yourCreditLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //            yourCreditLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            yourCreditValue.topAnchor.constraint(equalTo: yourCreditLabel.bottomAnchor, constant: 4),
            yourCreditValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        
    }
    
    private func setupIncreaseCreditButton() {
        increaseCreditButton.translatesAutoresizingMaskIntoConstraints = false
        increaseCreditButton.semanticContentAttribute = .forceRightToLeft
        increaseCreditButton.setTitle("افزایش اعتبار", for: .normal)
        increaseCreditButton.titleLabel?.font = UIFont(name: UIFont.BYekanName, size: 20)
        increaseCreditButton.setTitleColor(.luncehonLogoText, for: .normal)
        increaseCreditButton.addTarget( self , action: #selector(increaseButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            increaseCreditButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            increaseCreditButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +16),
        ])
        
        
    }
    @objc func increaseButtonTapped() {
        debugPrint("IncreaseButtonTapped")
        let vc = IncreaseCreditVC()
        
//        print(self.window?.rootViewController?.navigationController?.topViewController)
//        self.window?.rootViewController?.navigationController?.topViewController?.present(vc, animated: true, completion: nil)
        (((self.window?.rootViewController! as! MainTabBarViewController).selectedViewController) as! NavigationController).show(vc, sender: true)
        
    }
}

