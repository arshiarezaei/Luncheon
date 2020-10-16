//
//  EnterVerificationCodeVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/17/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class EnterVerificationCodeVC: UIViewController {
    
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let askToVerificationCodeLabel:UILabel = UILabel(frame: .zero)
    private let errorInEnteredVerificationCodeLabel:UILabel = UILabel(frame: .zero)
    
    private let verficationCodeTF:UITextField = UITextField(frame: .zero)
    
    private let confirmVerificationCodeButton:UIButton = UIButton(frame: .zero)
    
    private let cornerRadius:CGFloat = CGFloat(20.0)
    
    private let verificationCodeIsRequired:String = "وارد کردن کد تاییدیه الزامی است"
    private let verificationCodeOnlyContainsDigits:String = "کد تاییدیه فقط شامل عدد است"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteBackgroud
        self.view.semanticContentAttribute = .forceRightToLeft
        
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.view.addSubview(askToVerificationCodeLabel)
        setupAskToEnterVerificationCodeLabel()
        
        self.view.addSubview(verficationCodeTF)
        setupVerficationCodeTF()
        
        self.view.addSubview(errorInEnteredVerificationCodeLabel)
        setupErrorInEnteredVerificationCodeLabel()
        
        
        self.view.addSubview(confirmVerificationCodeButton)
        setupConfirmVerificationCodeButton()
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "بازگشت"
        backBarBtnItem.tintColor = .luncehonLogoText
        navigationItem.backBarButtonItem = backBarBtnItem
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.becomeFirstResponder()
        verficationCodeTF.resignFirstResponder()
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
    
    
    
    
    private func setupAskToEnterVerificationCodeLabel() {
        askToVerificationCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        askToVerificationCodeLabel.text = "یک کد برای شما پیامک شده است لطفا آن را وارد کنید"
        askToVerificationCodeLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        askToVerificationCodeLabel.textAlignment = .center
        askToVerificationCodeLabel.semanticContentAttribute = .forceRightToLeft
        
        
        
        NSLayoutConstraint.activate([
            askToVerificationCodeLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: luncheonLogo.bottomAnchor, constant:20),
            askToVerificationCodeLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
    
    private func setupVerficationCodeTF()  {
        //verficationCodeTF.delegate = self
        verficationCodeTF.translatesAutoresizingMaskIntoConstraints = false
        verficationCodeTF.layer.borderColor = UIColor.whiteBorder.cgColor
        verficationCodeTF.layer.borderWidth = 1
        verficationCodeTF.textAlignment = .center
        verficationCodeTF.semanticContentAttribute = .forceLeftToRight
        verficationCodeTF.layer.cornerRadius = cornerRadius
        verficationCodeTF.keyboardType = .decimalPad
        verficationCodeTF.clearButtonMode = .always
        verficationCodeTF.placeholder = "ـ‌ ـ ـ ـ ـ ـ"
        if #available(iOS 12.0, *){
            verficationCodeTF.textContentType = .oneTimeCode
        }
        
        NSLayoutConstraint.activate([
            verficationCodeTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            verficationCodeTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            verficationCodeTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: askToVerificationCodeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            verficationCodeTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    
    private func setupErrorInEnteredVerificationCodeLabel() {
        errorInEnteredVerificationCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        errorInEnteredVerificationCodeLabel.textColor = .luncehonLogoText
        errorInEnteredVerificationCodeLabel.textAlignment = .right
        errorInEnteredVerificationCodeLabel.semanticContentAttribute = .forceRightToLeft
        errorInEnteredVerificationCodeLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        
        NSLayoutConstraint.activate([
            errorInEnteredVerificationCodeLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: verficationCodeTF.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            errorInEnteredVerificationCodeLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            //            errorInEnteredVerificationCodeLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42)
            
            
        ])
    }
    
    private func setupConfirmVerificationCodeButton() {
        confirmVerificationCodeButton.translatesAutoresizingMaskIntoConstraints = false
        confirmVerificationCodeButton.layer.borderColor = UIColor.luncehonLogoText.cgColor
        confirmVerificationCodeButton.backgroundColor = .luncehonLogoText
        confirmVerificationCodeButton.layer.cornerRadius = 20
        confirmVerificationCodeButton.titleLabel?.textAlignment = .center
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string: "تایید", attributes: fontAttributes as [NSAttributedString.Key : Any])
        confirmVerificationCodeButton.setAttributedTitle(title, for: .normal)
        confirmVerificationCodeButton.addTarget(self, action: #selector(confirmVerficationCodeButtonTapped), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            confirmVerificationCodeButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            confirmVerificationCodeButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            confirmVerificationCodeButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: errorInEnteredVerificationCodeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            confirmVerificationCodeButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
    }
    
    @objc private func confirmVerficationCodeButtonTapped(){
        debugPrint("confirmVerficationCodeButtonTapped")
        guard  !(verficationCodeTF.text!.isEmpty) else {
            errorInEnteredVerificationCodeLabel.text = verificationCodeIsRequired
            return}
        
        guard let  _ = Utilities.phoneNumberValidation(phoneNumber: verficationCodeTF.text!) else {
            errorInEnteredVerificationCodeLabel.text = verificationCodeOnlyContainsDigits
            return
        }
        errorInEnteredVerificationCodeLabel.text = String()
        verficationCodeTF.resignFirstResponder()
        self.view.becomeFirstResponder()
        // MARK: prototype version
        if verficationCodeTF.text! != String(SampleUser.getCode) {
            errorInEnteredVerificationCodeLabel.text = "کد وارد شده صحیح نیست"
        }else{
            ((self.view.window?.rootViewController?.presentedViewController) as! SignUpVC).pushViewController(NewUserInformationsVC(), animated: true)
        }
        
        
        //        ((self.view.window?.rootViewController?.presentedViewController) as! SignUpVC).pushViewController(NewUserInformationsVC(), animated: true)
        
        // MARK: uncomment the following function for working version of Luncheon
        /*
         Network.validatingSMS(code: verficationCodeTF.text!){response in
         if let error = response{
         debugPrint("error in code verification \(error)")
         self.errorInEnteredVerificationCodeLabel.textAlignment  = .right
         self.errorInEnteredVerificationCodeLabel.semanticContentAttribute = .forceRightToLeft
         self.errorInEnteredVerificationCodeLabel.text = error.localizedDescription
         }
         else{
         DispatchQueue.main.async {
         ((self.view.window?.rootViewController?.presentedViewController) as! SignUpVC).pushViewController(NewUserInformationsVC(), animated: true)
         }
         }
         }
         */
        
    }
    
    
}


