//
//  EnterMobileNumberView.swift
//  Luncheon
//
//  Created by Arshiya on 12/16/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class EnterMobileNumberView: UIView {
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let askToEnterPhoneNumberLabel:UILabel = UILabel(frame: .zero)
    private let mobileNumberIsRequiredLabel:UILabel = UILabel(frame: .zero)
    
    private let mobileNumberTF:UITextField = UITextField(frame: .zero)
    
    private let requestForSMSButton:UIButton = UIButton(frame: .zero)
    
    private let cornerRadius:CGFloat = CGFloat(20.0)
    
    private let mobileNumber:String? = nil
    private let mobileNumberIsRequiredLabelTitle:String =  "وارد کردن شماره موبایل برای ثبت نام الزامی است."
    private let mobileNumberIsRequiredLabelTitle2:String =  "شماره موبایل فقط شامل اعداد می باشد."
    private let mobileNumberIsRequiredLabelTitle3:String =  "شماره وارد شده معتبر نمیباشد."
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .whiteBackgroud
        self.semanticContentAttribute = .forceRightToLeft
        
        self.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.addSubview(askToEnterPhoneNumberLabel)
        setupAskToEnterPhoneNumberLabel()
        
        self.addSubview(mobileNumberTF)
        setupMobileNumberTF()
        
        self.addSubview(mobileNumberIsRequiredLabel)
        setupMobileNumberIsRequiredLabel()
        
        
        
        self.addSubview(requestForSMSButton)
        setupRequestForSMSButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLuncheonLogo() {
        luncheonLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 70),
            luncheonLogo.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 78.0),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 78.0),
        ])
    }
    
    
    private func setupAskToEnterPhoneNumberLabel() {
        askToEnterPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        askToEnterPhoneNumberLabel.text = "برای ثبت نام لطفا شماره موبایل خود را وارد فرمایید."
        askToEnterPhoneNumberLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        askToEnterPhoneNumberLabel.textAlignment = .center
        askToEnterPhoneNumberLabel.semanticContentAttribute = .forceRightToLeft
        
        
        
        NSLayoutConstraint.activate([
            askToEnterPhoneNumberLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: luncheonLogo.bottomAnchor, constant:20),
            askToEnterPhoneNumberLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
    
    private func setupMobileNumberTF(){
        
        mobileNumberTF.translatesAutoresizingMaskIntoConstraints = false
        mobileNumberTF.placeholder = "شماره موبایل ... ۰۹"
        mobileNumberTF.layer.cornerRadius = 20.0
        mobileNumberTF.layer.borderWidth = 1
        mobileNumberTF.layer.borderColor = UIColor.lightGray.cgColor
        mobileNumberTF.textAlignment = .center
        mobileNumberTF.semanticContentAttribute = .forceLeftToRight
        mobileNumberTF.keyboardType = .phonePad
        mobileNumberTF.clearButtonMode = .always
        mobileNumberTF.font = UIFont.BYekan
        
        
        NSLayoutConstraint.activate([
            mobileNumberTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: askToEnterPhoneNumberLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            mobileNumberTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            mobileNumberTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            mobileNumberTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    
    private func setupMobileNumberIsRequiredLabel() {
        debugPrint("executing setupMobileNumberIsRequiredLabel")
        mobileNumberIsRequiredLabel.translatesAutoresizingMaskIntoConstraints = false
        mobileNumberIsRequiredLabel.textAlignment = .right
        mobileNumberIsRequiredLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        mobileNumberIsRequiredLabel.semanticContentAttribute = .forceRightToLeft
        mobileNumberIsRequiredLabel.textColor = UIColor.luncehonLogoText
        //        mobileNumberIsRequiredLabel.layer.borderColor = UIColor.black.cgColor
        //        mobileNumberIsRequiredLabel.layer.borderWidth = 2
        
        
        NSLayoutConstraint.activate([
            mobileNumberIsRequiredLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            mobileNumberIsRequiredLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: mobileNumberTF.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }
    
    private func setupRequestForSMSButton(){
        requestForSMSButton.translatesAutoresizingMaskIntoConstraints = false
        requestForSMSButton.backgroundColor = UIColor.luncehonLogoText
        requestForSMSButton.backgroundColor = UIColor.luncehonLogoText
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string: "تایید", attributes: fontAttributes as [NSAttributedString.Key : Any])
        requestForSMSButton.setAttributedTitle(title, for: .normal)
        requestForSMSButton.layer.cornerRadius = self.cornerRadius
        requestForSMSButton.addTarget(self, action: #selector(requestForSMSButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            requestForSMSButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: mobileNumberIsRequiredLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            requestForSMSButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            requestForSMSButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.mobileNumberTF.safeAreaLayoutGuide.widthAnchor),
            requestForSMSButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo:mobileNumberTF.safeAreaLayoutGuide.heightAnchor),
        ])
    }
    
    @objc private func requestForSMSButtonTapped() {
        guard  !(mobileNumberTF.text!.isEmpty) else { mobileNumberIsRequiredLabel.text = mobileNumberIsRequiredLabelTitle; return}
        guard mobileNumberTF.text?.count == 11 else {mobileNumberIsRequiredLabel.text = mobileNumberIsRequiredLabelTitle3 ; return}
        mobileNumberIsRequiredLabel.text = String()
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
