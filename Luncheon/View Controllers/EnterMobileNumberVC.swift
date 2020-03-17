//
//  EnterMobileNumberVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/16/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class EnterMobileNumberVC: UIViewController {
    
    
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let askToEnterPhoneNumberLabel:UILabel = UILabel(frame: .zero)
    private let mobileNumberIsRequiredLabel:UILabel = UILabel(frame: .zero)
    
    private let mobileNumberTF:UITextField = UITextField(frame: .zero)
    
    private let requestForSMSButton:UIButton = UIButton(frame: .zero)
    
    private let cornerRadius:CGFloat = CGFloat(20.0)
    
    private let mobileNumberIsRequiredLabelError:String =  "وارد کردن شماره موبایل برای ثبت نام الزامی است."
    private let mobileNumberIsRequiredLabelError2:String =  "شماره موبایل فقط شامل اعداد می باشد."
    private let mobileNumberIsRequiredLabelError3:String =  "شماره وارد شده معتبر نمیباشد."
    private let mobileNumberIsRequiredLabelError4:String =  "شماره موبایل تنها میتواند شامل عدد باشد."
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        self.view.backgroundColor = .whiteBackgroud
        self.view.semanticContentAttribute = .forceRightToLeft
        
        
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.view.addSubview(askToEnterPhoneNumberLabel)
        setupAskToEnterPhoneNumberLabel()
        
        self.view.addSubview(mobileNumberTF)
        setupMobileNumberTF()
        
        self.view.addSubview(mobileNumberIsRequiredLabel)
        setupMobileNumberIsRequiredLabel()
        
        
        
        self.view.addSubview(requestForSMSButton)
        setupRequestForSMSButton()
        
        //        let backBarBtnItem = UIBarButtonItem()
        //        backBarBtnItem.title = "بازگشت"
        //        backBarBtnItem.tintColor = .luncehonLogoText
        //        navigationItem.backBarButtonItem = backBarBtnItem
        
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        let backBarBtnItem = UIBarButtonItem()
    //        backBarBtnItem.title = "back"
    //        navigationController?.navigationBar.tintColor = .luncehonLogoText
    //        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close2"), style: .plain, target: self , action: #selector(closeButtonTapped))
    ////            UIBarButtonItem(title:"X", style: .plain, target: nil, action: nil)
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("EnterMobileNumberVC touchesBegan called")
        mobileNumberTF.resignFirstResponder()
        self.view.becomeFirstResponder()
    }
    
    
    
    private func setupNavigationBar() {
        let title = [NSAttributedString.Key.font:UIFont(name: UIFont.BYekanName, size: 30),NSAttributedString.Key.foregroundColor:UIColor.luncehonLogoText]
        self.navigationController?.navigationBar.titleTextAttributes = title as [NSAttributedString.Key : Any]
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target:self, action: #selector(closeButtonTapped))
        self.navigationController?.navigationBar.tintColor  = .luncehonLogoText
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .whiteBackgroud
        
        //setup backBarButtonItem
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "بازگشت"
        backBarBtnItem.tintColor = .luncehonLogoText
        navigationItem.backBarButtonItem = backBarBtnItem
        
    }
    
    private func setupLuncheonLogo() {
        luncheonLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 70),
            luncheonLogo.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
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
            askToEnterPhoneNumberLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
    
    private func setupMobileNumberTF(){
        //        mobileNumberTF.delegate = self
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
            mobileNumberTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            mobileNumberTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
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
            mobileNumberIsRequiredLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            mobileNumberIsRequiredLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: mobileNumberTF.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }
    
    private func setupRequestForSMSButton(){
        requestForSMSButton.translatesAutoresizingMaskIntoConstraints = false
        requestForSMSButton.backgroundColor = UIColor.luncehonLogoText
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string: "تایید", attributes: fontAttributes as [NSAttributedString.Key : Any])
        requestForSMSButton.setAttributedTitle(title, for: .normal)
        requestForSMSButton.layer.cornerRadius = self.cornerRadius
        requestForSMSButton.addTarget(self, action: #selector(requestForSMSButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            requestForSMSButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: mobileNumberIsRequiredLabel.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            requestForSMSButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            requestForSMSButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.mobileNumberTF.safeAreaLayoutGuide.widthAnchor),
            requestForSMSButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo:mobileNumberTF.safeAreaLayoutGuide.heightAnchor),
        ])
    }
    
    @objc private func requestForSMSButtonTapped() {
        debugPrint("requestForSMSButtonTapped")
        guard  !(mobileNumberTF.text!.isEmpty)
            else {
                mobileNumberTF.layer.borderColor = UIColor.luncehonLogoText.cgColor
                mobileNumberIsRequiredLabel.text = mobileNumberIsRequiredLabelError
                return}
        guard mobileNumberTF.text?.count == 11
            else {
                mobileNumberTF.layer.borderColor = UIColor.luncehonLogoText.cgColor
                mobileNumberIsRequiredLabel.text = mobileNumberIsRequiredLabelError3 ;
                return}
        guard let  _ = Utilities.phoneNumberValidation(phoneNumber: mobileNumberTF.text!)
            else {
                mobileNumberTF.layer.borderColor = UIColor.luncehonLogoText.cgColor
                mobileNumberIsRequiredLabel.text = mobileNumberIsRequiredLabelError4
                return
        }
        mobileNumberIsRequiredLabel.text = String()
        mobileNumberTF.resignFirstResponder()
        self.view.becomeFirstResponder()
        mobileNumberTF.layer.borderColor = UIColor.lightGray.cgColor
        
        Network.requesteSMS(clientNumber: mobileNumberTF.text!.persianToEnglishDigits){ error in
            if let error = error {
                self.mobileNumberIsRequiredLabel.text = error.localizedDescription
            }
            else{
                DispatchQueue.main.async {
                    let vc = EnterVerificationCodeVC()
                    ((self.view.window?.rootViewController?.presentedViewController) as! SignUpVC).pushViewController(vc, animated: true)
                }
            }
            
        }
        
    }
    
    @objc private func closeButtonTapped()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
