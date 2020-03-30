//
//  IncreaseCreditVC.swift
//  Luncheon
//
//  Created by Arshiya on 1/10/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit
import WebKit

class IncreaseCreditVC: UIViewController,UITextFieldDelegate,WKNavigationDelegate {
    
    private let yourCreditLabel: UILabel = {
        let ycl = UILabel(frame: .zero)
        ycl.translatesAutoresizingMaskIntoConstraints = false
        ycl.text = "اعتبار شما"
        ycl.font = UIFont(name: UIFont.BYekan.fontName, size: 15)
        ycl.semanticContentAttribute = .forceRightToLeft
        ycl.contentMode = .center
        return ycl
    }()
    
    private let yourCreditValueLabel: UILabel = {
        let ycl = UILabel(frame: .zero)
        ycl.translatesAutoresizingMaskIntoConstraints = false
        ycl.text = "\((UserStates.currentUserProfile!.credit/10 ))"
        ycl.text?.append("تومان ")
        ycl.font = UIFont(name: UIFont.BYekan.fontName, size: 30)
        ycl.semanticContentAttribute = .forceRightToLeft
        ycl.contentMode = .center
        ycl.textAlignment = .center
        return ycl
    }()
    
    private let valueTF:UITextField = {
        let vtf = UITextField(frame: .zero)
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.placeholder = "مبلغ را به تومان وارد کنید"
        vtf.layer.cornerRadius = UIUtilities.cornerRadius
        vtf.layer.borderColor = UIColor.lightGray.cgColor
        vtf.layer.borderWidth = 1
        vtf.keyboardType = .decimalPad
        vtf.contentMode = .center
        vtf.textAlignment = .center
        vtf.semanticContentAttribute = .forceLeftToRight
        vtf.clearButtonMode = .always
        vtf.font = UIFont.BYekan
        
        return vtf
    }()
    
    private let payButton: UIButton = {
        let pb = UIButton(frame: .zero)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.backgroundColor = UIColor.luncehonLogoText
        pb.layer.cornerRadius = UIUtilities.cornerRadius
        pb.setTitle("پرداخت", for: .normal)
        pb.titleLabel?.font = UIFont(name: UIFont.BYekanName, size: 15)
        return pb
    }()
    
    private let web:WKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteBackgroud
        
        
        view.addSubview(yourCreditLabel)
        setupYourCreditLabel()
        
        view.addSubview(yourCreditValueLabel)
        setupYourCreditValueLabel()
        
        view.addSubview(valueTF)
        setupValueTF()
        
        view.addSubview(payButton)
        setupPayButton()
    }
    
    private func setupYourCreditLabel() {
        NSLayoutConstraint.activate([
            yourCreditLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            yourCreditLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 52)
        ])
    }
    
    private func setupYourCreditValueLabel() {
        NSLayoutConstraint.activate([
            yourCreditValueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            yourCreditValueLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: yourCreditLabel.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupValueTF()  {
        valueTF.delegate = self
        NSLayoutConstraint.activate([
            valueTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            valueTF.topAnchor.constraint(equalTo: yourCreditValueLabel.bottomAnchor, constant: 50),
            valueTF.heightAnchor.constraint(equalToConstant: UIUtilities.defaultTFHeight),
            valueTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: UIUtilities.defaultTFWidth)
        ])
    }
    
    private func setupPayButton()  {
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            payButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            payButton.topAnchor.constraint(equalTo: valueTF.bottomAnchor, constant: 32),
            payButton.heightAnchor.constraint(equalToConstant: UIUtilities.defaultTFHeight),
            payButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: UIUtilities.defaultTFWidth)
        ])
    }
   
    @objc private func payButtonTapped(){
        debugPrint("paybuttonTapped")
        let value = (valueTF.text! as NSString).integerValue
        Network.increaseCredit(amount: value ){ paymenturl in
            if let paymenturl = paymenturl{
                DispatchQueue.main.async {
                    self.web.navigationDelegate = self
                    self.view = self.web
                    self.web.load(URLRequest(url: URL(string: paymenturl)!))
                    self.web.allowsBackForwardNavigationGestures = true
                }
            }
        }
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugPrint("touches began called")
        self.view.becomeFirstResponder()
        valueTF.resignFirstResponder()
        
    }
}
