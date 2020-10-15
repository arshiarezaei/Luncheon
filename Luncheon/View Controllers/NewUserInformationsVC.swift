//
//  NewUserInformationsVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/20/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class NewUserInformationsVC: UIViewController {
    
    
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let enterYourProfileInfoLabel:UILabel = UILabel(frame: .zero)
    
    
    private let nameTF:UITextField = UITextField(frame: .zero)
    private let lastNameTF:UITextField = UITextField(frame: .zero)
    private let emailTF:UITextField = UITextField(frame: .zero)
    private let passwordTF:UITextField = UITextField(frame: .zero)
    private let confirmPassowrdTF:UITextField = UITextField(frame: .zero)
    
    private let confirmInformationButton:UIButton = UIButton(frame: .zero)
    
    private let multiplier:CGFloat = CGFloat(0.8)
    private let cornerRadius:CGFloat = CGFloat(20)
    private let verticalSpacepaceBetweenTFs:CGFloat = CGFloat(24)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteBackgroud
        
        // Do any additional setup after loading the view.
        
        self.view.semanticContentAttribute = .forceRightToLeft
        
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.view.addSubview(enterYourProfileInfoLabel)
        setupEnterYourProfileInfoLabel()
        
        self.view.addSubview(nameTF)
        setupNameTF()
        
        self.view.addSubview(lastNameTF)
        setupLastnameTF()
        
        self.view.addSubview(emailTF)
        setupEmailTF()
        
        self.view.addSubview(passwordTF)
        setupPasswordTF()
        
        self.view.addSubview(confirmPassowrdTF)
        setupConfirmPassowrdTF()
        
        self.view.addSubview(confirmInformationButton)
        setupConfirmInformationButton()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("executing: NewUserInformationsVC->touchesBegan")
        for subView in self.view.subviews{
            if subView.isFirstResponder{
                subView.resignFirstResponder()
            }
        }
        self.view.becomeFirstResponder()
    }
    
    private func setupLuncheonLogo() {
        luncheonLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 16),
            luncheonLogo.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 78.0),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 78.0),
        ])
    }
    
    private func setupEnterYourProfileInfoLabel() {
        enterYourProfileInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        enterYourProfileInfoLabel.textAlignment = .center
        enterYourProfileInfoLabel.semanticContentAttribute = .forceRightToLeft
        enterYourProfileInfoLabel.text = "اطلاعات حساب کاربری خود را وارد کنید"
        enterYourProfileInfoLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        
        NSLayoutConstraint.activate([
            enterYourProfileInfoLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.luncheonLogo.safeAreaLayoutGuide.bottomAnchor,constant: 16),
            enterYourProfileInfoLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
    
    private func setupNameTF() {
        nameTF.tag = 1
        nameTF.delegate = self
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.textAlignment = .center
        nameTF.placeholder = "نام"
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.luncheonGray.cgColor
        nameTF.layer.cornerRadius = cornerRadius
        nameTF.font = UIFont.BYekan
        nameTF.returnKeyType = .next
        nameTF.clearButtonMode = .always
        nameTF.semanticContentAttribute = .forceLeftToRight
        
        NSLayoutConstraint.activate([
            nameTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            nameTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            nameTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.enterYourProfileInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            nameTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
    }
    
    private func setupLastnameTF() {
        lastNameTF.tag = nameTF.tag + 1
        lastNameTF.delegate = self
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        lastNameTF.placeholder = "نام خانوادگی"
        lastNameTF.textAlignment = .center
        lastNameTF.semanticContentAttribute = .forceLeftToRight
        lastNameTF.layer.borderWidth = 1
        lastNameTF.layer.borderColor = UIColor.luncheonGray.cgColor
        lastNameTF.layer.cornerRadius = cornerRadius
        lastNameTF.font = UIFont.BYekan
        lastNameTF.returnKeyType = .next
        lastNameTF.clearButtonMode = .always
        
        
        NSLayoutConstraint.activate([
            lastNameTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: nameTF.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            lastNameTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            lastNameTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            lastNameTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
    }
    
    private func setupEmailTF() {
        emailTF.tag = lastNameTF.tag + 1
        emailTF.delegate = self
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.placeholder = "رایانامه"
        emailTF.textAlignment = .center
        emailTF.semanticContentAttribute = .forceLeftToRight
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.luncheonGray.cgColor
        emailTF.textContentType = .emailAddress
        emailTF.returnKeyType = .next
        emailTF.layer.cornerRadius = cornerRadius
        emailTF.font = UIFont.BYekan
        emailTF.keyboardType = .emailAddress
        emailTF.clearButtonMode = .always
        
        NSLayoutConstraint.activate([
            emailTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: lastNameTF.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            emailTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            emailTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            emailTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        
    }
    
    private func setupPasswordTF() {
        passwordTF.tag = emailTF.tag + 1
        passwordTF.delegate = self
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "کلمه عبور"
        passwordTF.textAlignment = .center
        passwordTF.semanticContentAttribute = .forceLeftToRight
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.luncheonGray.cgColor
        passwordTF.textContentType = .password
        passwordTF.layer.cornerRadius = cornerRadius
        passwordTF.font = UIFont.BYekan
        passwordTF.isSecureTextEntry = true
        passwordTF.clearButtonMode = .always
        
        NSLayoutConstraint.activate([
            passwordTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: emailTF.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            passwordTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            passwordTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            passwordTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
    }
    
    private func setupConfirmPassowrdTF() {
        confirmPassowrdTF.tag = passwordTF.tag + 1
        confirmPassowrdTF.delegate = self
        confirmPassowrdTF.translatesAutoresizingMaskIntoConstraints = false
        confirmPassowrdTF.placeholder = "تایید کلمه عبور"
        confirmPassowrdTF.textAlignment = .center
        confirmPassowrdTF.semanticContentAttribute = .forceLeftToRight
        confirmPassowrdTF.layer.borderWidth = 1
        confirmPassowrdTF.layer.borderColor = UIColor.luncheonGray.cgColor
        confirmPassowrdTF.textContentType = .password
        confirmPassowrdTF.layer.cornerRadius = cornerRadius
        confirmPassowrdTF.font = UIFont.BYekan
        confirmPassowrdTF.returnKeyType = .go
        confirmPassowrdTF.isSecureTextEntry = true
        confirmPassowrdTF.clearButtonMode = .always
        
        NSLayoutConstraint.activate([
            confirmPassowrdTF.safeAreaLayoutGuide.topAnchor.constraint(equalTo: passwordTF.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            confirmPassowrdTF.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            confirmPassowrdTF.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            confirmPassowrdTF.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        
    }
    
    
    private func setupConfirmInformationButton()  {
        confirmInformationButton.translatesAutoresizingMaskIntoConstraints = false
        confirmInformationButton.semanticContentAttribute = .forceRightToLeft
        confirmInformationButton.layer.borderWidth = 1
        confirmInformationButton.layer.borderColor = UIColor.luncehonLogoText.cgColor
        confirmInformationButton.titleLabel?.textAlignment = .center
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string: "تایید", attributes: fontAttributes as [NSAttributedString.Key : Any])
        confirmInformationButton.setAttributedTitle(title, for: .normal)
        confirmInformationButton.addTarget(self, action: #selector(confirmInformationButtonTapped), for: .touchUpInside)
        confirmInformationButton.backgroundColor = .luncehonLogoText
        confirmInformationButton.layer.cornerRadius = cornerRadius
        
        
        NSLayoutConstraint.activate([
            confirmInformationButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: confirmPassowrdTF.safeAreaLayoutGuide.bottomAnchor, constant: verticalSpacepaceBetweenTFs),
            confirmInformationButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            confirmInformationButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: multiplier),
            confirmInformationButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        
    }
    
    private func formValidator() -> Bool {
        assertionFailure("not implemented")
        return false
    }
    
    @objc private func confirmInformationButtonTapped() {
        debugPrint("executing NewUserInformationsVC->confirmInformationButtonTapped")
        //        precondition(formValidator(), "check inputs")
        let name = nameTF.text!
        let familyName = lastNameTF.text!
        let email = emailTF.text!
        let password = passwordTF.text!
        
        debugPrint("\(name) \(familyName) \(email) \(password)")
        // MARK: PROTOTYPE
        let message = "به خانواد لانچن خوش آمدید"
        let a = UIAlertController(title:  "تبریک", message: message , preferredStyle: .alert)
        let action = UIAlertAction(title: "ایول", style: UIAlertAction.Style.default, handler:{_ in
                                    
                                    self.dismiss(animated: true, completion: nil)})
        action.setValue(UIColor.luncehonLogoText, forKey: "titleTextColor")
        a.addAction(action)
        a.setValue(NSAttributedString(string: a.message!, attributes: [NSAttributedString.Key.font : UIFont.BYekan.fontName, NSAttributedString.Key.foregroundColor : UIColor.green]), forKey: "attributedMessage")
        a.setValue(NSAttributedString(string: a.message!, attributes: [NSAttributedString.Key.font : UIFont.BYekan]), forKey: "attributedMessage")
        a.setValue(NSAttributedString(string: a.title!, attributes: [NSAttributedString.Key.font : UIFont.BYekan]), forKey: "attributedTitle")
        self.view.window?.rootViewController?.presentedViewController?.present(a, animated: true, completion: nil)
        // MARK: uncomment the following function for working version of Luncheon
        /*
         let info :[String:String] = ["email": email, "familyName": familyName, "name": name, "password": password, "username":email]
         Network.newUserRegistraion(infoItems: info){ (result,message) in
         if !result {
         debugPrint("registration completed")
         DispatchQueue.main.async {
         let a = UIAlertController(title:  "خطا", message: message! , preferredStyle: .alert)
         let action = UIAlertAction(title: "تلاش مجدد", style: UIAlertAction.Style.default, handler:nil)
         action.setValue(UIColor.luncehonLogoText, forKey: "titleTextColor")
         a.addAction(action)
         a.setValue(NSAttributedString(string: a.message!, attributes: [NSAttributedString.Key.font : UIFont.BYekan, NSAttributedString.Key.foregroundColor : UIColor.green]), forKey: "attributedMessage")
         a.setValue(NSAttributedString(string: a.message!, attributes: [NSAttributedString.Key.font : UIFont.BYekan]), forKey: "attributedMessage")
         a.setValue(NSAttributedString(string: a.title!, attributes: [NSAttributedString.Key.font : UIFont.BYekan]), forKey: "attributedTitle")
         self.view.window?.rootViewController?.presentedViewController?.present(a, animated: true, completion: nil)
         }
         }
         else{
         
         }
         
         }
         */
        
    }
    
    
    
}
