//
//  LoginOrSignUpView.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class LoginOrSignUpView: UIView {
    
    
    private let askToLoginLabel:UILabel = UILabel(frame: .zero)
    private let askForloginButton:UIButton = UIButton(frame: .zero)
    private let askForSingupLabel:UILabel = UILabel(frame: .zero)
    private let signupButton:UIButton = UIButton(frame: .zero)
    private let cornerRadius:CGFloat = CGFloat(20.0)
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .white
        
        self.addSubview(askToLoginLabel)
        setupAskToLoginLabel()
        
        self.addSubview(askForloginButton)
        setupAskForLoginButton()
        
        self.addSubview(askForSingupLabel)
        setupAskForSingupLabel()
        
        self.addSubview(signupButton)
        setupSignupButton()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAskToLoginLabel()  {
        askToLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        askToLoginLabel.text =  "برای مشاهده این صفحه لطفا به حساب کاربری خود وارد شوید"
        askToLoginLabel.textAlignment = .center
        askToLoginLabel.semanticContentAttribute = .forceRightToLeft
        askToLoginLabel.numberOfLines = 0
        askToLoginLabel.font = UIFont(name: UIFont.BYekanName, size: 20)
        
        NSLayoutConstraint.activate([
            askToLoginLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            askToLoginLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            askToLoginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30)
        ])
        
    }
    private func setupAskForLoginButton() {
        askForloginButton.translatesAutoresizingMaskIntoConstraints = false
        askForloginButton.setTitle("ورود", for: .normal)
        askForloginButton.setTitleColor(.luncehonLogoText, for: .normal)
        askForloginButton.setTitleColor(.white, for: .normal)
        askForloginButton.titleLabel?.font = UIFont(name:UIFont.BYekanName,size:20)
        askForloginButton.backgroundColor = .luncehonLogoText
        askForloginButton.layer.borderWidth = 2
        askForloginButton.titleLabel?.textAlignment = .center
        askForloginButton.titleLabel?.semanticContentAttribute = .forceRightToLeft
        askForloginButton.layer.cornerRadius = self.cornerRadius
        askForloginButton.titleLabel?.baselineAdjustment = .alignCenters
        askForloginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        askForloginButton.layer.masksToBounds = true
        askForloginButton.layer.borderColor = UIColor.luncehonLogoText.cgColor
        askForloginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            askForloginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            askForloginButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            askForloginButton.topAnchor.constraint(equalTo: self.askToLoginLabel.bottomAnchor, constant: 32)
        ])
        
    }
    
    private func setupAskForSingupLabel() {
        askForSingupLabel.translatesAutoresizingMaskIntoConstraints = false
        askForSingupLabel.text = "تا کنون ثبت نام نکرده اید؟"
        askForSingupLabel.font = UIFont.BYekan
        askForSingupLabel.textAlignment = .center
        askForSingupLabel.semanticContentAttribute = .forceRightToLeft
        askForSingupLabel.font = UIFont(name: UIFont.BYekan.fontName, size: 15)
        
        NSLayoutConstraint.activate([
            askForSingupLabel.topAnchor.constraint(equalTo: self.askForloginButton.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            askForSingupLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            askForSingupLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        ])
    }
    
    private func setupSignupButton(){
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setAttributedTitle(NSMutableAttributedString(string: "ثبت نام", attributes: [NSMutableAttributedString.Key.foregroundColor:UIColor.luncehonLogoText]), for: .normal)
        signupButton.layer.borderColor = UIColor.luncehonLogoText.cgColor
        signupButton.layer.borderWidth = 1
        signupButton.layer.cornerRadius = self.cornerRadius
        signupButton.setTitleColor(.luncehonLogoText, for: .normal)
        signupButton.titleLabel?.font = UIFont(name: UIFont.BYekanName, size: 20)
        signupButton.addTarget(self, action: #selector(askForSignUpbutton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: askForSingupLabel.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            signupButton.centerXAnchor.constraint(equalTo: askForSingupLabel.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            signupButton.widthAnchor.constraint(equalTo: askForloginButton.safeAreaLayoutGuide.widthAnchor, constant: 0)
        ])
        
    }
    
    @objc private func loginButtonTapped(_ sender:UIButton)  {
        debugPrint("askForlogin button tapped")
        window?.rootViewController?.present(LoginVC(), animated: true, completion: nil)
    }
    @objc private func askForSignUpbutton()  {
        debugPrint("askSignup button tapped")
        window?.rootViewController?.present(SignUpVC(), animated: true, completion: nil)
        
    }
}
