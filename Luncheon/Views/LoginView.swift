//
//  LoginView.swift
//  Luncheon
//
//  Created by Arshiya on 12/10/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let askToEnterInfoLabel:UILabel = UILabel(frame: .zero)
    private let usernameIsRequiredLabel:UILabel = UILabel(frame: .zero)
    private let passwordIsRequiredLabel:UILabel = UILabel(frame: .zero)
    
    private let usernameTextField:UITextField = UITextField(frame: .zero)
    private let passwordTextField:UITextField = UITextField(frame: .zero)
    
    private let loginButton:UIButton = UIButton(frame: .zero)
    private let forgotPasswordButton:UIButton = UIButton(frame: .zero)
    
    private let cornerRadius:CGFloat = CGFloat(20.0)
    
    private let usernameTFtitle:String = "نام کاربری"
    private let passwordTFtitle:String =  "گذر واژه"
    private let usernameIsRequired:String = "نام کاربری الزامی است."
    private let passwordIsRequired:String = "وارد کردن گذر واژه الزامی است"
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    override func layoutSubviews() {
        debugPrint("login view layout subviews called")
        self.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.addSubview(askToEnterInfoLabel)
        setupAskToEnterInfoLabel()
        
        self.addSubview(usernameTextField)
        setupUsernameTextField()
        
        self.addSubview(usernameIsRequiredLabel)
        setupUsernameIsRequiredLabel()
        
        self.addSubview(passwordTextField)
        setupPasswordTextField()
        
        self.addSubview(passwordIsRequiredLabel)
        setupPasswordIsRequiredLabel()
        
        self.addSubview(loginButton)
        setupLoginButton()
        
        self.addSubview(forgotPasswordButton)
        setupForgotPasswordButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("LoginView required init")
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        self.becomeFirstResponder()
    }
    
    private func setupLuncheonLogo() {
        luncheonLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 50),
            luncheonLogo.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 78.0),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 78.0),
        ])
    }
    
    private func setupAskToEnterInfoLabel(){
        askToEnterInfoLabel.text = "برای ورود اطلاعات خود را وارد کنید"
        askToEnterInfoLabel.font = UIFont(name: UIFont.BYekanName, size: 20)
        askToEnterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            askToEnterInfoLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: luncheonLogo.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            askToEnterInfoLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    private func setupUsernameTextField() {
        usernameTextField.delegate = self
        usernameTextField.tag = 1
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = usernameTFtitle
        usernameTextField.textAlignment = .center
        usernameTextField.font = UIFont.BYekan
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.whiteBorder.cgColor
        usernameTextField.layer.cornerRadius = self.cornerRadius
        usernameTextField.returnKeyType = .next
        usernameTextField.clearButtonMode = .always
        usernameTextField.keyboardType = .emailAddress
        
        NSLayoutConstraint.activate([
            usernameTextField.safeAreaLayoutGuide.topAnchor.constraint(equalTo: askToEnterInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            usernameTextField.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            usernameTextField.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            usernameTextField.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42),
        ])
        debugPrint("tf \(usernameTextField.bounds.width)")
    }
    
    private func setupUsernameIsRequiredLabel() {
        usernameIsRequiredLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameIsRequiredLabel.textColor = .luncehonLogoText
        usernameIsRequiredLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        usernameIsRequiredLabel.textAlignment = .right
        usernameIsRequiredLabel.semanticContentAttribute = .forceRightToLeft
        
        NSLayoutConstraint.activate([
            usernameIsRequiredLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: usernameTextField.safeAreaLayoutGuide.trailingAnchor),
            usernameIsRequiredLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: usernameTextField.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }
    
    private func setupPasswordTextField() {
        passwordTextField.delegate = self
        passwordTextField.tag = usernameTextField.tag + 1
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = self.passwordTFtitle
        passwordTextField.font = UIFont.BYekan
        passwordTextField.textAlignment = .center
        passwordTextField.layer.borderColor = UIColor.whiteBorder.cgColor
        passwordTextField.layer.cornerRadius = self.cornerRadius
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
        passwordTextField.returnKeyType = .go
        
        NSLayoutConstraint.activate([
            passwordTextField.safeAreaLayoutGuide.topAnchor.constraint(equalTo: usernameIsRequiredLabel.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            passwordTextField.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor,multiplier: 0.4),
            passwordTextField.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 42)
        ])
        
    }
    private func setupPasswordIsRequiredLabel() {
        passwordIsRequiredLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordIsRequiredLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        passwordIsRequiredLabel.textColor = UIColor.luncehonLogoText
        passwordIsRequiredLabel.textAlignment = .right
        passwordIsRequiredLabel.semanticContentAttribute = .forceRightToLeft
        
        NSLayoutConstraint.activate([
            passwordIsRequiredLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            passwordIsRequiredLabel.trailingAnchor.constraint(equalTo: passwordTextField.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        
    }
    private func setupLoginButton() {
//        loginButton.tag = 3
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor.luncehonLogoText
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: UIFont.BYekanName, size:20),NSAttributedString.Key.foregroundColor:UIColor.white]
        let title = NSAttributedString(string: "ورود", attributes: fontAttributes as [NSAttributedString.Key : Any])
        loginButton.setAttributedTitle(title, for: .normal)
        loginButton.layer.cornerRadius = self.cornerRadius
        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
//        loginButton.isEnabled = false
//        loginButton.alpha = 0.5
        
        NSLayoutConstraint.activate([
            loginButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: passwordIsRequiredLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            loginButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            loginButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo:passwordTextField.safeAreaLayoutGuide.heightAnchor),
        ])
    }
    
    private func setupForgotPasswordButton() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        let quote = "رمز عبور خود را فراموش کرده ام"
        let attributes = [NSAttributedString.Key.underlineStyle: 1,NSAttributedString.Key.font:UIFont.BYekan,NSAttributedString.Key.foregroundColor :UIColor.luncehonLogoText] as [NSAttributedString.Key : Any]
        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
        forgotPasswordButton.setAttributedTitle(attributedQuote, for: .normal)
        NSLayoutConstraint.activate([
            forgotPasswordButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: loginButton.safeAreaLayoutGuide.bottomAnchor,constant: 70),
            forgotPasswordButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            
        ])
    }
    
    @objc private func loginButtonTapped(_ sender:UIButton) {
        guard usernameTextField.text != "" && passwordTextField.text != ""  else {
            if usernameTextField.text == "" {
                usernameIsRequiredLabel.text = usernameIsRequired
                passwordIsRequiredLabel.text = String()
            }
            if passwordTextField.text == ""  {
                usernameIsRequiredLabel.text = String()
                passwordIsRequiredLabel.text = passwordIsRequired
            }
            if usernameTextField.text == "" && passwordTextField.text == ""{
                usernameIsRequiredLabel.text = usernameIsRequired
                passwordIsRequiredLabel.text = passwordIsRequired
            }
            return
        }
        usernameIsRequiredLabel.text = String()
        passwordIsRequiredLabel.text = String()
        
        debugPrint("login\(usernameTextField.text!) \(passwordTextField.text!)")
    }
}
