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
        nameTF.layer.borderColor = UIColor.lightGray.cgColor
        nameTF.layer.cornerRadius = cornerRadius
        nameTF.font = UIFont.BYekan
        nameTF.returnKeyType = .next
        
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
        lastNameTF.semanticContentAttribute = .forceRightToLeft
        lastNameTF.layer.borderWidth = 1
        lastNameTF.layer.borderColor = UIColor.lightGray.cgColor
        lastNameTF.layer.cornerRadius = cornerRadius
        lastNameTF.font = UIFont.BYekan
        lastNameTF.returnKeyType = .next
        
        
        
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
        emailTF.semanticContentAttribute = .forceRightToLeft
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.lightGray.cgColor
        emailTF.textContentType = .emailAddress
        emailTF.returnKeyType = .next
        emailTF.layer.cornerRadius = cornerRadius
        emailTF.font = UIFont.BYekan
        
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
        passwordTF.semanticContentAttribute = .forceRightToLeft
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.lightGray.cgColor
        passwordTF.textContentType = .password
        passwordTF.layer.cornerRadius = cornerRadius
        passwordTF.font = UIFont.BYekan
        passwordTF.isSecureTextEntry = true
        
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
        confirmPassowrdTF.semanticContentAttribute = .forceRightToLeft
        confirmPassowrdTF.layer.borderWidth = 1
        confirmPassowrdTF.layer.borderColor = UIColor.lightGray.cgColor
        confirmPassowrdTF.textContentType = .password
        confirmPassowrdTF.layer.cornerRadius = cornerRadius
        confirmPassowrdTF.font = UIFont.BYekan
        confirmPassowrdTF.returnKeyType = .go
        confirmPassowrdTF.isSecureTextEntry = true
        
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
    
    @objc private func confirmInformationButtonTapped() {
        debugPrint("executing NewUserInformationsVC->confirmInformationButtonTapped")
        let name = nameTF.text!
        let familyName = lastNameTF.text!
        let email = emailTF.text!
        let password = passwordTF.text!
        
        debugPrint("\(name) \(familyName) \(email) \(password)")
//        Networking.UserRegistration(email: email, familyName: familyName, name: name, password: password, username: email){ error in
//            if error == nil{
//                debugPrint("registration successful")
//            }
//            else{
//                debugPrint(error!)
//            }
//
//        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
